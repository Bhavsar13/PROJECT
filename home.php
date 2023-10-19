<section id="banner">
    <!-- Slider -->
    <div id="main-slider" class="flexslider">
        <ul class="slides">
            <li>
                <img src="<?php echo web_root; ?>/plugins/home-plugins/img/slides/4.jpg" alt="" width="739" height="503" />
                <div class="flex-caption">
                    <h3>Unlock Your Future</h3>
                    <p>Discover exciting internship opportunities to kickstart your career.</p>
                </div>
            </li>
            <li>
                <img src="<?php echo web_root; ?>/plugins/home-plugins/img/slides/2.jpg" alt="" />
                <div class="flex-caption">
                    <h3>Specialize in Your Passion</h3>
                    <p>Find internships that align with your interests and aspirations.</p>
                </div>
            </li>
        </ul>
    </div>
    <!-- End Slider -->
</section>

<section id="call-to-action-2">
    <div class="container">
        <div class="row">
            <div class="col-md-10 col-sm-9">
                <h3>Take the First Step</h3>
                <p>Explore internship opportunities and shape your future career path.</p>
            </div>
        </div>
    </div>
</section>

<section id="content">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="aligncenter">
                    <h2 class="aligncenter">Welcome to Our Internship Portal</h2>
                </div>
                <br />
            </div>
        </div>
        <?php
        $sql = "SELECT * FROM `tblcompany`";
        $mydb->setQuery($sql);
        $comp = $mydb->loadResultList();

        foreach ($comp as $company) {
        ?>
        <div class="col-sm-4 info-blocks">

            <div class="info-blocks">
                <h3><?php echo $company->COMPANYNAME; ?></h3>
                <p>Address: <?php echo $company->COMPANYADDRESS; ?></p>
                <p>Contact No.: <?php echo $company->COMPANYCONTACTNO; ?></p>
            </div>
        </div>
        <?php } ?>
    </div>
</section>

<section class="section-padding gray-bg">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="section-title text-center">
                    <h2>Explore Popular Internship Categories</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <?php
                $sql = "SELECT * FROM `tblcategory`";
                $mydb->setQuery($sql);
                $cur = $mydb->loadResultList();

                foreach ($cur as $result) {
                    echo '<div class="col-md-3" style="font-size: 15px; padding: 5px">* <a href="' . web_root . 'index.php?q=category&search=' . $result->CATEGORY . '">' . $result->CATEGORY . '</a></div>';
                }
                ?>
            </div>
        </div>
    </div>
</section>

<section id="content-3-10" class="content-block data-section nopad content-3-10">
    <div class="image-container col-sm-6 col-xs-12 pull-left">
        <div class="background-image-holder">
        </div>
    </div>

    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-6 col-sm-offset-6 col-xs-12 content">
                <div class="editContent">
                    <h3>Your Path to Success</h3>
                </div>
                <div class="editContent" style="height: 235px;">
                    <p>&nbsp;&nbsp;Our mission is to connect you with opportunities that match your skills and aspirations. Whether you're just starting your career or looking to advance, we're here to help you achieve your goals. We believe in your potential and are committed to providing you with the support and resources you need to succeed.</p>
                </div>
            </div>
        </div><!-- /.row-->
    </div>

</section>

<div class="about home-about">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <!-- Heading and para -->
                <div class="block-heading-two">
                    <h3><span>Discover Our Programs</span></h3>
                </div>
                <p>Explore internship programs designed to boost your career and personal growth. We believe in nurturing talent and fostering innovation.</p>
            </div>
            <div class="col-md-4">
                <div class="block-heading-two">
                    <h3><span>Stay Informed</span></h3>
                </div>
                <!-- Accordion starts -->
                <div class="panel-group" id="accordion-alt3">
                    <!-- Panel. Use "panel-XXX" class for different colors. Replace "XXX" with color. -->
                    <div class="panel">
                        <!-- Panel heading -->
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion-alt3" href="#collapseOne-alt3">
                                    <i class="fa fa-angle-right"></i> Latest Internship News
                                </a>
                            </h4>
                        </div>
                        <div id="collapseOne-alt3" class="panel-collapse collapse">
                            <!-- Panel body -->
                            <div class="panel-body">
                                Stay updated with the latest news, events, and opportunities in the world of internships.
                            </div>
                        </div>
                    </div>
                    <!-- Add more accordion items as needed -->
                </div>
                <!-- Accordion ends -->
            </div>
            <div class="col-md-4">
                <div class="block-heading-two">
                    <h3><span>What Our Interns Say</span></h3>
                </div>
                <div class="testimonials">
                    <div class="active item">
                        <blockquote>
                            <p>"I had a fantastic experience working with this company."</p>
                        </blockquote>
                        <div class="carousel-info">
                            <img alt="" src="plugins/home-plugins/img/avatar.png" class="pull-left">
                            <div class="pull-left">
                                <span class="testimonials-name">Sujal Bhavsar</span>
                                <span class="testimonials-post">Intern,ATMC</span>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
