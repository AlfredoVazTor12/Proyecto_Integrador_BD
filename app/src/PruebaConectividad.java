import java.sql.*;

public class PruebaConectividad {

    private static final String URL = "jdbc:mysql://localhost:3306/control_estudios?useSSL=false&allowPublicKeyRetrieval=true";
    private static final String USER = "root";
    private static final String PASSWORD = "tu_password";

    public static void main(String[] args) {
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD)) {
            System.out.println("Conexión exitosa a la base de datos.");

            // 1. Inserción programática en tabla relacional (DOCUMENTO)
            String insertSQL = "INSERT INTO documento (nombre_doc, tipo_archivo, ruta_fisica, id_usuario, id_ministerio, id_categoria) "
                             + "VALUES (?, ?, ?, ?, ?, ?)";
            
            try (PreparedStatement stmtInsert = conn.prepareStatement(insertSQL)) {
                stmtInsert.setString(1, "Informe_Financiero_2026.pdf");
                stmtInsert.setString(2, ".pdf");
                stmtInsert.setString(3, "/uploads/docs/Informe_Financiero_2026.pdf");
                stmtInsert.setInt(4, 1);
                stmtInsert.setInt(5, 1);
                stmtInsert.setInt(6, 1);

                int filas = stmtInsert.executeUpdate();
                System.out.println("Inserción realizada con éxito. Filas insertadas: " + filas);
            }

            // 2. Consulta programática con JOIN entre dos tablas (DOCUMENTO y USUARIO)
            String selectSQL = "SELECT d.id_documento, d.nombre_doc, d.tipo_archivo, u.nombre AS usuario_nombre "
                             + "FROM documento d "
                             + "INNER JOIN usuario u ON d.id_usuario = u.id_usuario";

            try (Statement stmtSelect = conn.createStatement();
                 ResultSet rs = stmtSelect.executeQuery(selectSQL)) {

                System.out.println("\n--- RESULTADO DE CONSULTA RELACIONAL (JOIN) ---");
                while (rs.next()) {
                    System.out.printf("ID Doc: %d | Nombre: %s | Tipo: %s | Subido por: %s%n",
                            rs.getInt("id_documento"),
                            rs.getString("nombre_doc"),
                            rs.getString("tipo_archivo"),
                            rs.getString("usuario_nombre"));
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
