<master>


  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
  





<div class="container" ng-app="incursionApp" ng-controller="estadisticasController"> 

      <!--Falta configuar el boton de refresh (refreshTable())y agregar los filtros y cada columna correspondiente

    <button class="btn btn-primary"><span class="glyphicon glyphicon-refresh"></span> Actualizar</button>-->


    <nav class="navbar navbar-expand-lg navbar navbar-dark bg-primary">
      </button>
      <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <div class="navbar-nav">
          <a class="nav-item nav-link " href="http://localhost:8000/tda-inclusion/coordinador">Inclusiones </a>
          <a class="nav-item nav-link" href="http://localhost:8000/tda-inclusion/cerrados">Abrir/Cerrar Cursos</a>
          <a class="nav-item nav-link active" >Estadisticas<span class="sr-only">(current)</span></a>
        </div>
      </div>
    </nav>



      <div class = "row">

    <div class="col">

          <label for="modalidad_select">Seleccione la Modalidad</label>

      <select class="form-control" ng-model="inclusion.modalidades" ng-init="inclusion.modalidades = modalidadQuery[0]" ng-options="modalidad as modalidad.nombre_modalidad for modalidad in modalidadQuery track by modalidad.id_modalidad" ng-change="getPeriodos()" required>

        <option value="">--Elige opcion--</option>

      </select>

          </div>



          <div class="col">

          <label for="periodo_select">Seleccione la Periodo</label>

      <select class="form-control" ng-model="inclusion.periodos" ng-init="inclusion.periodos = periodoQuery[0]" ng-options="periodo as periodo.nombre_periodo for periodo in periodoQuery track by periodo.id_periodo" ng-change="getResultados()" required>

        <option value="">--Elige opcion--</option>

      </select>

        </div>

    </div>



     <br>

    <canvas id="myChart" style="display:none" width="200" height="400" > </canvas>


  
    

</div>








<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>


  <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

  <script src="node_modules/angular/angular.min.js"></script>


  <script src="resources/js/estadisticas.js"></script>