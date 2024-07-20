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

    </head>

    <body>

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
                            <li class="nav-item "><a class="nav-link" href="MainController?action=Home">Home</a></li>
                            <li class="nav-item active"><a class="nav-link" href="MainController?action=ProductList">Shop</a></li>
                                <c:if test="${sessionScope['LOGIN_USER']!=null}">
                                <li class="dropdown">
                                    <a href="#" class="nav-link dropdown-toggle arrow" data-toggle="dropdown">${sessionScope['LOGIN_USER'].fullName}</a>
                                    <c:if test="${sessionScope['LOGIN_USER'].roleID=='US'}">
                                        <ul class="dropdown-menu">
                                            <li><a href="myorder">My Order</a></li>
                                        </ul>
                                    </c:if>
                                </li>
                                <li class="nav-item"><a class="nav-link" href="MainController?action=LogoutController">Logout</a></li>
                                    <c:if test="${sessionScope['LOGIN_USER'].roleID=='AD'}">
                                    <li class="nav-item"><a class="nav-link" href="ManagerProduct">Manage Product</a></li>
                                    </c:if>
                                </c:if>

                            <c:if test="${sessionScope['LOGIN_USER']==null}">
                                <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                            </c:if>
                            <form action="ProductList" method="get">
                                <div class="search-container">
                                    <input style="border-radius: 1.5rem;" type="text" placeholder="Search..." name="search" value="${param.search}">
                                    <button  style="  border-radius: 1.5rem; "class="search-button" type="submit" >Search</button>
                                </div>
                            </form>
                        </ul>
                    </div>
                    <!-- /.navbar-collapse -->

                    <!-- Start Atribute Navigation -->
                    <div class="attr-nav">
                        <ul>
                            <li class="side-menu">
                                <a href="MainController?action=View">
                                    <i class="fa fa-shopping-bag"></i>
                                    <p>My Cart</p>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <!-- End Atribute Navigation -->
                </div>
            </nav>
            <!-- End Navigation -->
        </header>

        <!-- Start Shop Page  -->
        <div class="shop-box-inner">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12 col-xs-12 shop-content-right">
                        <div class="right-product-box">
                            <div class="product-category grid-style">

                                <!-- Start sort  -->
                                <div id="top-functions-area" class="top-functions-area row">
                                    <form action="ProductList" method="get" class="row g-12">
                                        <div class="flt-item to-left col-md-6">
                                            <div>
                                                <select name="categoryId" onchange="this.form.submit()" class="form-select">
                                                    <option value="">All Category</option>
                                                    <c:forEach var="c" items="${clist}">
                                                        <option value="${c.getId()}" ${param['categoryId']==c.getId()?"selected":""}>${c.getName()}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="flt-item to-right col-md-6">
                                            <div>
                                                <select name="sort" class="form-select" onchange="this.form.submit()">
                                                    <option value="0" ${param['sort']==0?"selected":""}>Sort Default</option>
                                                    <option value="1" ${param['sort']==1?"selected":""}>Newest</option>
                                                    <option value="2" ${param['sort']==2?"selected":""}>Price ascending</option>
                                                    <option value="3" ${param['sort']==3?"selected":""}>Price descending</option>
                                                </select>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <!-- End sort  -->

                            </div>
                            <div class="product-categorie-box">
                                <div class="tab-content">
                                    <div role="tabpanel" class="tab-pane fade show active" id="grid-view">
                                        <div class="row">
                                            <c:forEach var="o" items="${plist}">
                                                <div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">
                                                    <div class="products-single fix">
                                                        <div class="box-img-hover">
                                                            <div class="type-lb">
                                                                <a href="./CartDetails?oid=${o.id}"><p class="sale">Detail</p></a>
                                                            </div>
                                                            <img style="width: 22rem; height: 27rem;" src="${o.image}" class="img-fluid" alt="Image">                                                               
                                                        </div>
                                                        <div class="why-text">
                                                            <h4>${o.name}</h4>
                                                            <h5> $${o.price}</h5>
                                                            <h5><a class="cart" href="MainController?action=Add&pid=${o.id}&quantity=1">Add to Cart</a></h5>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>


                                        </div>
                                        <div style="display: flex; justify-content: center;">
                                            <ul class="pagination" >
                                                <li  class="page-item next"><a href="ProductList?index=1&categoryId=${param['categoryId']}">
                                                        <i class="fa fa-angle-left" class="page-link" aria-hidden="true"></i></a></li>
                                                        <c:forEach var = "i" begin = "1" end = "${numberPage}">
                                                    <li class="${param['index']==i?'page-item active':'page-item'}">
                                                        <a href="ProductList?index=${i}&categoryId=${param['categoryId']}"   class="page-link">${i}</a></li>
                                                    </c:forEach>
                                                <li  class="page-item next"><a href="ProductList?index=${numberPage}&categoryId=${param['categoryId']}">
                                                        <i class="fa fa-angle-right" class="page-link" aria-hidden="true"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>                                   
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- End Shop Page -->

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
    <script src="js/jquery-ui.js"></script>
    <script src="js/jquery.nicescroll.min.js"></script>
    <script src="js/form-validator.min.js"></script>
    <script src="js/contact-form-script.js"></script>
    <script src="js/custom.js"></script>
</body>

</html>