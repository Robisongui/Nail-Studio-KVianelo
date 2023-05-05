

<%@page language="java" import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
   
   <title>Document</title>
</head>
<body>
   <%
   // Cria as variaveis e armazena as informações digitadas pelo usuario
   String vnome  = request.getParameter("txtNome");
   int    vtelefone = Integer.parseInt( request.getParameter("txtTelefone") ) ;
   int    vdata = Integer.parseInt( request.getParameter("txtdata") ) ;
   int    vhora = Integer.parseInt( request.getParameter("txthora") ) ;
   String vservicos = request.getParameter("txtservicos");
 
   // Variaveis para o banco de dados
   String banco    = "aula" ;
   String endereco = "jdbc:mysql://localhost:3306/" + banco ;
   String usuario  = "root";
   String senha    = "" ;

   String driver   = "com.mysql.jdbc.Driver" ;

   //Carregar o driver na memória
   Class.forNome( driver ) ;

   //Cria a variavel para conectar com banco
   Connection conexao ;

   //Abrir a conexao com o banco
   conexao = DriverManager.getConnection(endereco, usuario, senha) ;

   String sql = "INSERT INTO nail (nome,telefone,data,hora,servico) values (?,?,?,?,?) " ;

   // Cria o statement para executar o camando no banco
   PreparedStatement stm = conexao.prepareStatement( sql );
   stm.setString( 1 , vnome ) ;
   stm.setInt( 2 , vtelefone ) ;
   stm.setInt( 3 , vdata ) ;
   stm.setInt( 4 , vhora ) ;
   stm.setString (5 , vservicos) ;

   stm.execute();

   conexao.close() ;
   stm.close() ;

   out.print("Dados gravados com sucesso!!!");
   out.print("<br><br>");
   out.print("<a href='agendamento.html'>Voltar</a>");
%>
</body>
</html>
