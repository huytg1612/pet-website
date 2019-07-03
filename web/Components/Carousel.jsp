<%-- 
    Document   : Carousel
    Created on : Jun 8, 2019, 3:17:12 PM
    Author     : SE130226
--%>

<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" style="padding: 2% 4%;">
    <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img class="d-block w-100" src="<%= request.getContextPath()%>/images/Carousel/slide1.jpg" alt="First slide" style="height: 340px !important;">
        </div>
        <div class="carousel-item">
            <img class="d-block w-100"src="<%= request.getContextPath()%>/images/Carousel/slide2.jpg" alt="Second slide" style="height: 340px !important;">
        </div>
        <div class="carousel-item">
            <img class="d-block w-100" src="<%= request.getContextPath()%>/images/Carousel/slide3.jpg" alt="Third slide" style="height: 340px !important;">
        </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
