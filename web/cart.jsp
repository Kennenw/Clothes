<%-- 
    Document   : cart
    Created on : Jul 6, 2023, 8:13:16 PM
    Author     : chi
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <!-- Basic -->

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Site Metas -->
        <title>Clothing</title>
        <meta name="keywords" content="">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- Site Icons -->
        <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
        <link rel="apple-touch-icon" href="images/apple-touch-icon.png">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- Site CSS -->
        <link rel="stylesheet" href="css/style.css">
        <!-- Responsive CSS -->
        <link rel="stylesheet" href="css/responsive.css">
        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/custom.css">

        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>

    <body>
        <!-- Start Main Top -->
        <header class="main-header">
            <!-- Start Navigation -->
            <nav class="navbar navbar-expand-lg navbar-light bg-light navbar-default bootsnav">
                <div class="container">
                    <!-- Start Header Navigation -->
                    <div class="navbar-header">
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-menu" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
                            <i class="fa fa-bars"></i>
                        </button>
                        <a class="navbar-brand" href="MainController?action=Home"><img src="images/logo.jpg" width="100rem;" class="logo" alt=""></a>
                    </div>
                    <!-- End Header Navigation -->

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="navbar-menu">
                        <ul class="nav navbar-nav ml-auto" data-in="fadeInDown" data-out="fadeOutUp">
                            <li class="nav-item active"><a class="nav-link" href="MainController?action=Home">Home</a></li>
                            <li class="nav-item"><a class="nav-link" href="MainController?action=ProductList">Shop</a></li>
                                <c:if test="${sessionScope['LOGIN_USER']!=null}">
                                <li class="dropdown">
                                    <a href="#" class="nav-link dropdown-toggle arrow" data-toggle="dropdown">${sessionScope['LOGIN_USER'].fullName}</a>
                                    <ul class="dropdown-menu">
                                        <li><a href="myorder">My Order</a></li>
                                    </ul>
                                </li>
                                <li class="nav-item"><a class="nav-link" href="MainController?action=LogoutController">Logout</a></li>
                                    <c:if test="${sessionScope['LOGIN_USER'].roleID=='AD'}">
                                    <li class="nav-item"><a class="nav-link" href="ManagerProduct">Manage Product</a></li>
                                    </c:if>
                                </c:if>
                                <c:if test="${sessionScope['LOGIN_USER']==null}">
                                <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>

                            </c:if>
                        </ul>
                    </div>
                    <!-- /.navbar-collapse -->                  
                </div>

            </nav>
            <!-- End Navigation -->
        </header>
        <!-- End Main Top -->

        <!-- Start Cart  -->
        <div class="cart-box-main">
            <div class="container">
                <form action="UpdateCart" method="post">
                    <div class="row">
                    <div class="col-lg-12">
                        <div class="table-main table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Images</th>
                                        <th>Product Name</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Total</th>
                                        <th>Remove</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="cart" items="${sessionScope['cart'].items}">
                                        <tr>
                                            <td class="thumbnail-img">
                                                <a href="CartDetails?oid=${cart.product.id}">
                                                    <img class="img-fluid" src="${cart.product.image}" alt="" />
                                                </a>
                                            </td>
                                            <td class="name-pr">
                                                <a href="CartDetails?oid=${cart.product.id}">
                                                    ${cart.product.name}
                                                </a>
                                            </td>
                                            <td class="price-pr">
                                                <p>$ ${cart.product.price}</p>
                                            </td>
                                            <td class="quantity-box"><input type="number" name="quantity_${cart.product.id}" size="4" value="${cart.quantity}" min="0" step="1" class="c-input-text qty text"></td>
                                            <td class="total-pr">
                                                <p>$ ${cart.product.price*cart.quantity}</p>
                                            </td>
                                            <td class="remove-pr">
                                                <a href="DeleteCartItem?pid=${cart.product.id}">
                                                    <i class="fas fa-times"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <div class="update-box">
                                <input value="Update" type="submit">
                            </div>
                        </div>
                    </div>
                </div>
                </form>
                
                <form action="checkout" method="GET">
                    <div class="row my-5">
                        <div class="col-lg-6 col-sm-6">
                            <div class="coupon-box">
                                <div class="input-group input-group-sm">
                                    <input class="form-control" name="note" placeholder="Enter your note .." aria-label="Coupon code" type="text">
                                    <div class="input-group-append">
                                        <button class="btn btn-theme" type="button">Note</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-sm-6">
                         
                            <div class="update-box">
                                <input value="Checkout" type="submit">
                            </div>
                        </div>
                    </div>
                </form>
                <p style="color: red;">${mess}</p>
            </div>
        </div>

        <!-- Start Footer  -->
        <footer>
            <div class="footer-main">
                <div class="container">                  
                    <div class="row">
                        <div class="col-lg-4 col-md-12 col-sm-12">
                            <div class="footer-widget">
                                <h4>About Freshshop</h4>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p> 
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p> 							
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-12 col-sm-12">
                            <div class="footer-link">
                                <h4>Information</h4>
                                <ul>
                                    <li><a href="#">About Us</a></li>
                                    <li><a href="#">Customer Service</a></li>
                                    <li><a href="#">Our Sitemap</a></li>
                                    <li><a href="#">Terms &amp; Conditions</a></li>
                                    <li><a href="#">Privacy Policy</a></li>
                                    <li><a href="#">Delivery Information</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-12 col-sm-12">
                            <div class="footer-link-contact">
                                <h4>Contact Us</h4>
                                <ul>
                                    <li>
                                        <p><i class="fas fa-map-marker-alt"></i>Address: Michael I. Days 3756 <br>Preston Street Wichita,<br> KS 67213 </p>
                                    </li>
                                    <li>
                                        <p><i class="fas fa-phone-square"></i>Phone: <a href="tel:+1-888705770">+1-888 705 770</a></p>
                                    </li>
                                    <li>
                                        <p><i class="fas fa-envelope"></i>Email: <a href="mailto:contactinfo@gmail.com">contactinfo@gmail.com</a></p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- End Footer  -->

        <!-- Start copyright  -->
        <div class="footer-copyright">
            <p class="footer-company">All Rights Reserved. &copy; 2018 <a href="#">ThewayShop</a> Design By :
                <a href="https://html.design/">html design</a></p>
        </div>
        <!-- End copyright  -->

        <a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>

        <!-- ALL JS FILES -->
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <!-- ALL PLUGINS -->
        <script src="js/jquery.superslides.min.js"></script>
        <script src="js/bootstrap-select.js"></script>
        <script src="js/inewsticker.js"></script>
        <script src="js/bootsnav.js."></script>
        <script src="js/images-loded.min.js"></script>
        <script src="js/isotope.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/baguetteBox.min.js"></script>
        <script src="js/form-validator.min.js"></script>
        <script src="js/contact-form-script.js"></script>
        <script src="js/custom.js"></script>
    </body>

</html>
