/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.54
 * Generated at: 2022-06-06 08:34:03 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class ad_005fproduct_005flist_005fdelivery_005fD_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("jar:file:/C:/WebStudy/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Admin_BBS/WEB-INF/lib/standard.jar!/META-INF/c.tld", Long.valueOf(1098678690000L));
    _jspx_dependants.put("/WEB-INF/lib/standard.jar", Long.valueOf(1651191084430L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fimport_0026_005furl_005fnobody;

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fc_005fimport_0026_005furl_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fc_005fimport_0026_005furl_005fnobody.release();
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");

	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<!-- 기기별 크기 담당 -->\r\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width\", initial-scale=\"1\">\r\n");
      out.write("<!-- 디자인 담당 -->\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/bootstrap.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/custom.css\">\r\n");
      out.write("<title>ad_productlist_direct.jsp</title>\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"");
      out.print(cp);
      out.write("/css/main.css\">\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("  #set {\r\n");
      out.write("    border-left: 1px solid gray;\r\n");
      out.write("    padding: 10px;\r\n");
      out.write("  }\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      if (_jspx_meth_c_005fimport_005f0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div class=\"container\">\r\n");
      out.write("\t<div class=\"row\">\r\n");
      out.write("\t<h1>관리자모드_상품상세_택배</h1> <!-- 왜 서체가? 배민서체지? 커스텀 css해놔서 그럼 -->\r\n");
      out.write("\t<span style=\"color: red; margin-bottom: 10px;\">※ 해당 상품은 신고가 접수되었습니다.</span>\r\n");
      out.write("\t\t<table class=\"table table-striped\" style=\"text-align: center; border: 1px solid #dddddd; width: 700px\">\r\n");
      out.write("\t\t\t<thead><!-- 제목 -->\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t    <th style=\"background-color: #eeeeee; text-align: center;\">상품 번호</th>\r\n");
      out.write("\t\t\t\t    <td colspan=\"2\">P03546</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t    <th style=\"background-color: #eeeeee; text-align: center;\">게시 일자</th>\r\n");
      out.write("\t\t\t\t    <td colspan=\"2\">2022-05-22</td>\r\n");
      out.write("\t\t\t\t</tr>\t\t\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t    <th style=\"background-color: #eeeeee; text-align: center;\">제목</th>\r\n");
      out.write("\t\t\t\t    <td colspan=\"2\"><a href=\"#\">CPU 팔아요</a></td>\r\n");
      out.write("\t\t\t\t</tr>\t\t\t\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t    <th style=\"background-color: #eeeeee; text-align: center;\">거래 방식</th>\r\n");
      out.write("\t\t\t\t    <td colspan=\"2\">택배거래</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t    <th style=\"background-color: #eeeeee; text-align: center;\">판매자 ID</th>\r\n");
      out.write("\t\t\t\t    <td colspan=\"2\">hjajks78</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t    <th style=\"background-color: #eeeeee; text-align: center;\">게시글 상태</th>\r\n");
      out.write("\t\t\t\t    <td>\r\n");
      out.write("\t\t\t\t    \t<select name=\"name\" id=\"\">\r\n");
      out.write("\t\t\t\t\t\t    <option value=\"1\">카테고리</option>\r\n");
      out.write("\t\t\t\t\t\t    <option value=\"2\">거래중</option>\r\n");
      out.write("\t\t\t\t\t\t    <option value=\"3\">거래완료</option>\r\n");
      out.write("\t\t\t\t    \t</select>\r\n");
      out.write("\t\t\t\t    </td>\r\n");
      out.write("\t\t\t\t    <td><form action=\"\"><label><input type=\"checkbox\" name=\"subs\" />블라인드</label></form></td>\r\n");
      out.write("\t\t\t\t</tr>\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t</thead>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<br /><br />\r\n");
      out.write("\t\t<h2><b>상품정보</b></h2>\r\n");
      out.write("\t\t<table class=\"table table-striped\" style=\"text-align: center; border: 1px solid #dddddd; width: 700px\">\r\n");
      out.write("\t\t\t<thead><!-- 제목 -->\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t    <th style=\"background-color: #eeeeee; text-align: center;\">카테고리</th>\r\n");
      out.write("\t\t\t\t    <td>\r\n");
      out.write("\t\t\t\t    \t<select name=\"name\" id=\"\">\r\n");
      out.write("\t\t\t\t\t\t    <option value=\"1\">카테고리</option>\r\n");
      out.write("\t\t\t\t\t\t    <option value=\"2\">2</option>\r\n");
      out.write("\t\t\t\t\t\t    <option value=\"3\">3</option>\r\n");
      out.write("\t\t\t\t\t\t    <option value=\"4\">4</option>\t\t\t\t    \t\r\n");
      out.write("\t\t\t\t    \t</select>\r\n");
      out.write("\t\t\t\t    </td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t    <th style=\"background-color: #eeeeee; text-align: center;\">물품명</th>\r\n");
      out.write("\t\t\t\t    <td>청축 키보드</td>\r\n");
      out.write("\t\t\t\t</tr>\t\t\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t    <th style=\"background-color: #eeeeee; text-align: center;\">제조사</th>\r\n");
      out.write("\t\t\t\t    <td>중국</td>\r\n");
      out.write("\t\t\t\t</tr>\t\t\t\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t    <th style=\"background-color: #eeeeee; text-align: center;\">희망 가격</th>\r\n");
      out.write("\t\t\t\t    <td>300,000원</td>\r\n");
      out.write("\t\t\t\t</tr>\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t</thead>\r\n");
      out.write("\t\t</table>\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<br /><br />\r\n");
      out.write("\t\t<h2><b>거래 정보</b></h2>\r\n");
      out.write("\t\t<table class=\"table table-striped\" style=\"text-align: center; border: 1px solid #dddddd; width: 700px\">\r\n");
      out.write("\t\t\t<thead><!-- 제목 -->\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t    <th style=\"background-color: #eeeeee; text-align: center;\">구매자ID</th>\r\n");
      out.write("\t\t\t\t    <td>inseong12</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t    <th style=\"background-color: #eeeeee; text-align: center;\">가격</th>\r\n");
      out.write("\t\t\t\t    <td>280,000원</td>\r\n");
      out.write("\t\t\t\t</tr>\t\t\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t    <th style=\"background-color: #eeeeee; text-align: center;\">구매 일시</th>\r\n");
      out.write("\t\t\t\t    <td>2022 - 05 - 24   17:30</td>\r\n");
      out.write("\t\t\t\t</tr>\t\t\t\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t    <th style=\"background-color: #eeeeee; text-align: center;\">배송 장소</th>\r\n");
      out.write("\t\t\t\t    <td>인천 광역시 계양구 새벌로 112번길 13 405동 관리사무소 앞</td>\r\n");
      out.write("\t\t\t\t</tr>\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t</thead>\r\n");
      out.write("\t\t</table>\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<br /><br />\r\n");
      out.write("\t\t<h2><b>거래 완료 정보</b></h2>\r\n");
      out.write("\t\t<table class=\"table table-striped\" style=\"text-align: center; border: 1px solid #dddddd; width: 700px\">\r\n");
      out.write("\t\t\t<thead><!-- 제목 -->\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t    <th style=\"background-color: #eeeeee; text-align: center;\">구매 확정 일시</th>\r\n");
      out.write("\t\t\t\t    <td colspan=\"2\"></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t    <th style=\"background-color: #eeeeee; text-align: center;\">판매 확정 일시</th>\r\n");
      out.write("\t\t\t\t    <td colspan=\"2\"></td>\r\n");
      out.write("\t\t\t\t</tr>\t\t\t\t\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t    <th style=\"background-color: #eeeeee; text-align: center;\">운송장</th>\r\n");
      out.write("\t\t\t\t    <td>우체국</td>\r\n");
      out.write("\t\t\t\t    <td id=\"set\">asdf45679849656</td> \r\n");
      out.write("\t\t\t\t</tr>\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t</thead>\r\n");
      out.write("\t\t</table>\t\r\n");
      out.write("\t\t\r\n");
      out.write("\r\n");
      out.write("\t\t<br /><br />\r\n");
      out.write("\t\t<h2><b>입찰 내역(제안 내역)</b></h2>\r\n");
      out.write("\t\t<table class=\"table table-striped\" style=\"text-align: center; border: 1px solid #dddddd; width: 700px\">\r\n");
      out.write("\t\t\t<thead><!-- 제목 -->\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t    <th style=\"background-color: #eeeeee; text-align: center;\">제안자ID</th>\r\n");
      out.write("\t\t\t\t    <th style=\"background-color: #eeeeee; text-align: center;\">제안 시간</th>\r\n");
      out.write("\t\t\t\t    <th style=\"background-color: #eeeeee; text-align: center;\">제안 가격</th>\r\n");
      out.write("\t\t\t\t    <th style=\"background-color: #eeeeee; text-align: center;\">제안 상태</th>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</thead>\t    \r\n");
      out.write("\t\t\t<tbody>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t    <td>agsdag455</td>\r\n");
      out.write("\t\t\t\t    <td>022-05-23  11:06:20</td>\r\n");
      out.write("\t\t\t\t    <td>+28,000</td>\r\n");
      out.write("\t\t\t\t    <td>낙찰(채택)</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</tbody> \r\n");
      out.write("\t\t\t\t    \r\n");
      out.write("\t\t</table>\t\t\t\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<br />\r\n");
      out.write("\t\t<br />\r\n");
      out.write("\t\t<br />\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\t\t<div style=\"margin-left: 590px\">\t\t\r\n");
      out.write("\t\t\t\t\t<button type=\"button\" class=\"btn btn-primary\">저장</button>\t\r\n");
      out.write("\t\t\t\t\t<button type=\"button\" class=\"btn btn-dark\">삭제</button>\t\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<br />\r\n");
      out.write("\t\t<br />\r\n");
      out.write("\t\t<br />\r\n");
      out.write("\t\t<br />\r\n");
      out.write("\t\t<br />\r\n");
      out.write("\t\t<br />\r\n");
      out.write("\t\t<br />\r\n");
      out.write("\t\t<br />\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t</div>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<script src=\"https://code.jquery.com/jquery-3.1.1.min.js\"></script>\r\n");
      out.write("<script src=\"js/bootstrap.js\"></script>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_c_005fimport_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:import
    org.apache.taglibs.standard.tag.rt.core.ImportTag _jspx_th_c_005fimport_005f0 = (org.apache.taglibs.standard.tag.rt.core.ImportTag) _005fjspx_005ftagPool_005fc_005fimport_0026_005furl_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.ImportTag.class);
    boolean _jspx_th_c_005fimport_005f0_reused = false;
    try {
      _jspx_th_c_005fimport_005f0.setPageContext(_jspx_page_context);
      _jspx_th_c_005fimport_005f0.setParent(null);
      // /ad_product_list_delivery_D.jsp(27,0) name = url type = null reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fimport_005f0.setUrl("ad_Header.jsp");
      int[] _jspx_push_body_count_c_005fimport_005f0 = new int[] { 0 };
      try {
        int _jspx_eval_c_005fimport_005f0 = _jspx_th_c_005fimport_005f0.doStartTag();
        if (_jspx_th_c_005fimport_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
          return true;
        }
      } catch (java.lang.Throwable _jspx_exception) {
        while (_jspx_push_body_count_c_005fimport_005f0[0]-- > 0)
          out = _jspx_page_context.popBody();
        _jspx_th_c_005fimport_005f0.doCatch(_jspx_exception);
      } finally {
        _jspx_th_c_005fimport_005f0.doFinally();
      }
      _005fjspx_005ftagPool_005fc_005fimport_0026_005furl_005fnobody.reuse(_jspx_th_c_005fimport_005f0);
      _jspx_th_c_005fimport_005f0_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fimport_005f0, _jsp_getInstanceManager(), _jspx_th_c_005fimport_005f0_reused);
    }
    return false;
  }
}
