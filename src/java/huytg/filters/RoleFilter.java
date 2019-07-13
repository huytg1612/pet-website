/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huytg.filters;

import huytg.dtos.RegistrationDetailDTO;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author SE130226
 */
public class RoleFilter implements Filter {

    private static final String CUSTOMER = "SystemLoadController";
    private static final String ADMIN = "AdminRecordController";
    private static final String LOGIN = "login.jsp";

    private static final boolean debug = true;

    // The filter configuration object we are associated with.  If
    // this value is null, this filter instance is not currently
    // configured. 
    private FilterConfig filterConfig = null;

    public RoleFilter() {
    }

    private void doBeforeProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("RoleFilter:DoBeforeProcessing");
        }

        // Write code here to process the request and/or response before
        // the rest of the filter chain is invoked.
        // For example, a logging filter might log items on the request object,
        // such as the parameters.
        /*
	for (Enumeration en = request.getParameterNames(); en.hasMoreElements(); ) {
	    String name = (String)en.nextElement();
	    String values[] = request.getParameterValues(name);
	    int n = values.length;
	    StringBuffer buf = new StringBuffer();
	    buf.append(name);
	    buf.append("=");
	    for(int i=0; i < n; i++) {
	        buf.append(values[i]);
	        if (i < n-1)
	            buf.append(",");
	    }
	    log(buf.toString());
	}
         */
    }

    private void doAfterProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("RoleFilter:DoAfterProcessing");
        }

        // Write code here to process the request and/or response after
        // the rest of the filter chain is invoked.
        // For example, a logging filter might log the attributes on the
        // request object after the request has been processed. 
        /*
	for (Enumeration en = request.getAttributeNames(); en.hasMoreElements(); ) {
	    String name = (String)en.nextElement();
	    Object value = request.getAttribute(name);
	    log("attribute: " + name + "=" + value.toString());

	}
         */
        // For example, a filter might append something to the response.
        /*
	PrintWriter respOut = new PrintWriter(response.getWriter());
	respOut.println("<P><B>This has been appended by an intrusive filter.</B>");
         */
    }

    /**
     *
     * @param request The servlet request we are processing
     * @param response The servlet response we are creating
     * @param chain The filter chain we are processing
     *
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet error occurs
     */
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        String url = null;

        HttpServletRequest req = (HttpServletRequest) request;
        HttpSession session = req.getSession();

        String uri = req.getRequestURI();
        int index = uri.lastIndexOf("/");
        String resource = uri.substring(index);

        RegistrationDetailDTO dto = (RegistrationDetailDTO) session.getAttribute("USER");
        String role = (String) session.getAttribute("ROLE");
        String action = req.getParameter("action");

        System.out.println("RS: "+resource);
        
        if(action == null){
            action = "";
        }
        
        if(uri.contains("/user/")||uri.contains("/admin/")||uri.contains("/service/")||uri.contains("/user_petmanage/")){
            if(role == null){
                url = CUSTOMER;
            }else if(role.equals("customer")){
                url = CUSTOMER;
            }else if(role.equals("admin")){
                url = ADMIN;
            }
        }
        
        if (role == null){
            if (resource.contains("CheckOut") || resource.contains("Delete") || resource.contains("Update")
                    || resource.contains("Edit") || resource.contains("/Admin") || resource.contains("Profile")
                    || action.equals("CheckOut") || resource.contains("/Pet") || resource.contains("/Schedule")
                    || resource.contains("/Search") || resource.contains("/Invoice")) {
                url = LOGIN;
            } else {
                if (resource.equals("/index.jsp")) {
                    url = CUSTOMER;
                }
            }
        } else {
            if (resource.equals("/index.jsp") && role.equals("customer")) {
                url = CUSTOMER;
            } else if (resource.equals("/admin/admin.jsp") && role.equals("admin")) {
                url = ADMIN;
            } else if (resource.equals("/login.jsp")) {
                if (role.equals("customer")) {
                    url = CUSTOMER;
                } else if (role.equals("admin")) {
                    url = ADMIN;
                }
            }

            //Case: admin forward to user controller or jsp
            if (resource.contains("/index.jsp") || resource.contains("/MainController")
                    || resource.contains("/Accessory") || resource.contains("/Cart") || resource.contains("/System") || resource.equals("/")
                    || resource.contains("/Schedule") || resource.contains("/Service") || resource.contains("/Invoice")) {
                if (role.equals("admin")) {
                    url = ADMIN;
                }
            }

            //Case: user forward to admin controller or jsp
            if (resource.contains("/admin.jsp") || resource.contains("/Admin")) {
                if (role.equals("customer")) {
                    url = CUSTOMER;
                }
            }
        }

        if (url != null) {
            req.getRequestDispatcher(url).forward(request, response);

        } else {
            System.out.println("123");
            chain.doFilter(request, response);

        }

    }

    /**
     * Return the filter configuration object for this filter.
     */
    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    /**
     * Set the filter configuration object for this filter.
     *
     * @param filterConfig The filter configuration object
     */
    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    /**
     * Destroy method for this filter
     */
    public void destroy() {
    }

    /**
     * Init method for this filter
     */
    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (debug) {
                log("RoleFilter:Initializing filter");
            }
        }
    }

    /**
     * Return a String representation of this object.
     */
    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("RoleFilter()");
        }
        StringBuffer sb = new StringBuffer("RoleFilter(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
    }

    private void sendProcessingError(Throwable t, ServletResponse response) {
        String stackTrace = getStackTrace(t);

        if (stackTrace != null && !stackTrace.equals("")) {
            try {
                response.setContentType("text/html");
                PrintStream ps = new PrintStream(response.getOutputStream());
                PrintWriter pw = new PrintWriter(ps);
                pw.print("<html>\n<head>\n<title>Error</title>\n</head>\n<body>\n"); //NOI18N

                // PENDING! Localize this for next official release
                pw.print("<h1>The resource did not process correctly</h1>\n<pre>\n");
                pw.print(stackTrace);
                pw.print("</pre></body>\n</html>"); //NOI18N
                pw.close();
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        } else {
            try {
                PrintStream ps = new PrintStream(response.getOutputStream());
                t.printStackTrace(ps);
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        }
    }

    public static String getStackTrace(Throwable t) {
        String stackTrace = null;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            t.printStackTrace(pw);
            pw.close();
            sw.close();
            stackTrace = sw.getBuffer().toString();
        } catch (Exception ex) {
        }
        return stackTrace;
    }

    public void log(String msg) {
        filterConfig.getServletContext().log(msg);
    }

}
