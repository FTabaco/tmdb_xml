<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet  [
	<!ENTITY nbsp   "&#160;">
	<!ENTITY copy   "&#169;">
	<!ENTITY reg    "&#174;">
	<!ENTITY trade  "&#8482;">
	<!ENTITY mdash  "&#8212;">
	<!ENTITY ldquo  "&#8220;">
	<!ENTITY rdquo  "&#8221;"> 
	<!ENTITY pound  "&#163;">
	<!ENTITY yen    "&#165;">
	<!ENTITY euro   "&#8364;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
<xsl:template match="/">
<html lang="en">

<head>
    <title>Title</title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <!-- Bootstrap CSS v5.2.1 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
</head>

<body>
    <header>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="#"><img src="img/logotmdb.png" alt="logo" width="70" /></a>

                <button class="navbar-toggler d-lg-none" type="button" data-bs-toggle="collapse"
                    data-bs-target="#collapsibleNavId" aria-controls="collapsibleNavId" aria-expanded="false"
                    aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>

                </button>
                <div class="collapse navbar-collapse" id="collapsibleNavId">
                    <ul class="navbar-nav mx-auto mt-2 mt-lg-0">

                        <li class="nav-item">
                            <a class="nav-link" href="#">Peliculas</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Personajes</a>
                        </li>

                        
                    </ul>

                </div>
            </div>
        </nav>
        <div class="row mt-3 justify-content-center">
		<xsl:for-each select="tmdb/persons/person">
            <div class="col-md-6 col-lg-4 ">
                <div class="card h-100">
                    <img class="card-img-top img-fluid" src="{foto}" alt="Title" />
                    <div class="card-body">
                        <h4 class="card-title"><xsl:value-of select="@nombre"/></h4>
                        <p class="card-text"><xsl:value-of select="peliculas"/></p>
                    </div>
                </div>
            </div>
</xsl:for-each>
            <div class="row mt-4">
			<xsl:for-each select="tmdb/movies/movie">
                <div class="col-lg-6">
                    <div class="card">
                        <div class="row">
                            <div class="col-4">
                                <img class="card-img-top" src="{foto}" alt="Title"/>
                            </div>
                            <div class="col-8">
                                <div class="card-body">
                                    <h4 class="card-title"><xsl:value-of select="@titulo"/></h4>
                                    <p class="card-text"><xsl:value-of select="fecha"/></p>
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
			
        </div>
    </header>
    <main></main>
    <footer>
        <h2 class="text-center text-success bg-dark p-3 ">The movie Db</h2>
        <!-- place footer here -->
    </footer>
    <!-- Bootstrap JavaScript Libraries -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
        integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
        crossorigin="anonymous"></script>
</body>

</html>


</xsl:template>
</xsl:stylesheet>