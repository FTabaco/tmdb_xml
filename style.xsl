<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet  [
<!ENTITY copy   "&#169;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
    <xsl:template match="/">
        
        <html lang="en" >
            
            <head>
                <title>TMDB</title>
                <!-- Required meta tags -->
                <meta charset="utf-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                
                <!-- Bootstrap CSS v5.2.1 -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
                      integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous"/>
                
            </head>
            
            <body>
                <div class="container shadow p-0">
                    <nav class="navbar navbar-expand-md navbar-light bg-dark">
                        <div class="container">
                            <a class="navbar-brand" href="#"><img src="img/logotmdb.png" alt="" width="80" /></a>
                            <button class="navbar-toggler d-lg-none" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapsibleNavId" aria-controls="collapsibleNavId" aria-expanded="false"
                                    aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <div class="collapse navbar-collapse" id="collapsibleNavId">
                                <ul class="navbar-nav mx-auto mt-2 mt-lg-0">
                                    <li class="nav-item">
                                        <a class="nav-link btn btn-success text-white mx-1 fs-4" href="#" onclick="document.getElementById('persons').style.display='flex';document.getElementById('movies').style.display='none';">Person</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link btn btn-success text-white mx-1 fs-4" href="#" onclick="document.getElementById('persons').style.display='none';document.getElementById('movies').style.display='flex';">Movie</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link btn btn-success text-white mx-1 fs-4" href="#" onclick="document.getElementById('persons').style.display='flex';document.getElementById('movies').style.display='flex';">All</a>
                                    </li>
                                    
                                </ul>
                                
                            </div>
                        </div>
                    </nav>
                    
                    <div class="row mt-3 justify-content-center" id="persons">
                        <xsl:for-each select="tmdb/persons/person">
                            <div class="col-lg-4 col-md-6 mb-3 d-flex">
                                <div class="card flex-fill">
                                    <xsl:choose>
                                        <xsl:when test="foto = ''">
                                            <img class="card-img-top img-fluid" src="img/noimageperson.png" alt="Title" />
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <img class="card-img-top img-fluid" src="{foto}" alt="Title" />
                                        </xsl:otherwise>
                                    </xsl:choose>
                                    
                                    <div class="card-body">
                                        <h4 class="card-title"><xsl:value-of select="@nombre"/></h4>
                                        <p class="card-text"><xsl:value-of select="peliculas"/></p>
                                    </div>
                                </div>
                            </div>
                        </xsl:for-each>
                    </div>
                    <div class="row mt-3 justify-content-center" id="movies">
                        <xsl:for-each select="tmdb/movies/movie">
                            <xsl:sort select="rating" order="descending" data-type="number"/>
                            <div class="col-md-6 mb-3">
                                <div class="card">
                                    <div class="row">
                                        <div class="col-4">
                                            <xsl:choose>
                                                <xsl:when test="foto = ''">
                                                    <img class="card-img-top img-fluid" src="img/noimagemovie.png" alt="Title" />
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <img class="card-img-top img-fluid" src="{foto}" alt="Title" />
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </div>
                                        <div class="col-8">
                                            <div class="card-body">
                                                <h4 class="card-title"><xsl:value-of select="@titulo"/></h4>
                                                <p class="card-text"><xsl:value-of select="fecha"/> </p>
                                                <xsl:choose>
                                                    <xsl:when test="rating &lt; 60">
                                                        <p class="card-text">Rating: <span class="bg-danger text-white rounded-pill p-1"><xsl:value-of select="rating"/></span></p>
                                                    </xsl:when>
                                                    <xsl:when test="rating &gt; 70">
                                                        <p class="card-text">Rating: <span class="bg-success  text-white rounded-pill p-1"><xsl:value-of select="rating"/></span></p>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <p class="card-text">Rating: <span class="bg-warning rounded-pill p-1"><xsl:value-of select="rating"/></span></p>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </xsl:for-each>
                    </div>
                    <h2 class="bg-dark text-success text-center p-2 m-0 mt-3">&copy; The Movie DB</h2>
                </div>
                <!-- Bootstrap JavaScript Libraries -->
                <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
                        integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous">
                </script>
                
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
                        integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz" crossorigin="anonymous">
                </script>
            </body>
            
        </html>
        
    </xsl:template>
</xsl:stylesheet>