<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>SELECCIÓN CURSO - EVG</title>

        <link rel="stylesheet" href="css/style.css" type="text/css">
    </head>
    <body>
        <header>
            <div>
                <img src="img/logotipo.png" alt="Logo de la escuela">
            </div>
            <nav>
                <a href="login.html">LOGIN</a>
            </nav>
        </header>
        <main id="reservasHtml">
            <section>
                <form action="realzarReserva.php" method="post">
                    <h2>Reservas de libros</h2>
                    <article>
                        <input type="text" name="nombreAlumno" id="nombreAlumno" placeholder="Nombre alumno">
                        <input type="text" name="apellidoAlumno" id="apellidoAlumno" placeholder="Apellido alumno">
                    </article>
                    <input type="email" name="correo" id="" placeholder="Correo alumno/tutor legal">
                    <select name="libros" id="libros">
                        <option selected disabled hidden>Selecciona Etapa</option>
                        <option value="inf">Infantil</option>
                        <option value="bach">Bachillerato</option>
                        <option value="cgm">Ciclo Grado Medio</option>
                        <option value="cgs">Ciclo Grado Superior</option>
                    </select>
                    <article id="radiobutton">
                        <div>
                            <input type="checkbox" name="Libro[]" value="1">
                            <label for="libro[]">Libro 1</label>
                        </div>
                        <div>
                            <input type="checkbox" name="Libro[]" value="2">
                            <label for="libro[]">Libro 2</label>
                        </div>
                        <div>
                            <input type="checkbox" name="Libro[]" value="3">
                            <label for="libro[]">Libro 3</label>
                        </div>
                        <div>
                            <input type="checkbox" name="Libro[]" value="4">
                            <label for="libro[]">Libro 4</label>
                        </div>
                        <div>
                            <input type="checkbox" name="Libro[]" value="5">
                            <label for="libro[]">Libro 5</label>
                        </div>
                        <div>
                            <input type="checkbox" name="Libro[]" value="6">
                            <label for="libro[]">Libro 6</label>
                        </div>
                    </article>
                    <input type="file" name="justificante" id="Subir justificante" accept=".pdf,.png,.jpg,.jpeg"/>
                    <input type="submit" name="reserva" value="Realizar reserva"/>
                </form>
            </section>
        </main>
        <footer>
            <div class="lineaFooter">
                <h3>Contactar</h3>
                <p>C/ Corte de Peleas, 79 06009 Badajoz</p>
                <p>+34 924 25 17 61</p>
            </div>
            <div class="lineaFooter">
                <h3>Colaboradores</h3>
                <ul>
                    <li>Álvaro Gómez</li>
                    <li>Celia Moruno Herrojo</li>
                    <li>Joaquín Telo</li>
                    <li>Miriam López</li>
                </ul>        
            </div>
            <div>
                <a href="https://fundacionloyola.com/vguadalupe/politica-de-cookies/">Políticas Cookies</a>
                <a href="https://fundacionloyola.com/vguadalupe/politica-de-privacidad/">Políticas Privacidad</a>
            </div>
        </footer>
    </body>
</html>