<%@ page import="java.io.OutputStream" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.picturehouse.picturehouse441.daos.eventDao"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%

  String sid = request.getParameter("id");
  int id = Integer.parseInt(sid);
  byte[] byteArray = eventDao.getPhoto(id);
  response.setContentType("image/gif");
  OutputStream os = response.getOutputStream();
  os.write(byteArray);
  os.flush();
  os.close();
  return;

%>