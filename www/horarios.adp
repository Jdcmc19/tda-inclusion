<master>


  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
  





<div class="container" ng-app="incursionApp" ng-controller="horariosController"> 

      <!--Falta configuar el boton de refresh (refreshTable())y agregar los filtros y cada columna correspondiente

    <button class="btn btn-primary"><span class="glyphicon glyphicon-refresh"></span> Actualizar</button>-->


    <nav class="navbar navbar-expand-lg navbar navbar-dark bg-primary">
      </button>
      <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <div class="navbar-nav">
          <a class="nav-item nav-link " href="http://localhost:8000/tda-inclusion/estudiante">Inclusiones </a>
          <a class="nav-item nav-link active" >Guia de Horarios<span class="sr-only">(current)</span></a>
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

      <select class="form-control" ng-model="inclusion.periodos" ng-init="inclusion.periodos = periodoQuery[0]" ng-options="periodo as periodo.nombre_periodo for periodo in periodoQuery track by periodo.id_periodo" ng-change="getSedes()" required>

        <option value="">--Elige opcion--</option>

      </select>

        </div>

    </div>

    <br>



          <div>

      <div class="form-group">

          <label for="sede_select">Seleccione la Sede</label>

      <select id= "Sedes" name="Sedes" class="form-control" ng-model="inclusion.sedeSeleccionada" ng-init="inclusion.sedeSeleccionada = sedeQuery[0]" ng-options="sede as sede.nombre_sede for sede in sedeQuery track by sede.id_sede" ng-change="getEscuelas()" required>

        <option value="">--Elige opcion--</option>

      </select>

            <!--<pre> {{ sedeQuery | json }} </pre>

            <pre> {{ inclusion.sedeSeleccionada }} </pre>-->

        </div>



        <div class="form-group">

            <label for="escuela_select">Seleccione la Escuela</label>

      <select id= "Escuelas" name="Escuelas" class="form-control" ng-model="inclusion.escuelaSeleccionada" ng-init="inclusion.escuelaSeleccionada = escuelaQuery[0]" ng-options="escuela as escuela.nombre_escuela for escuela in escuelaQuery track by escuela.id_escuela" ng-change="getGuia()" required >

        <option value="">--Elige opcion--</option>

      </select>

            <!--<pre> {{ escuelaQuery | json }} </pre>

            <pre> {{ escuelaSeleccionada }} </pre>-->

        </div>



    



     <br>





     <form>

    <div class="form-group">

      <div class="input-group">

        <div class="input-group-addon"><i class="fa fa-search"></i></div>

        <input type="text" class="form-control" placeholder="Buscar ..." ng-model="search">

      </div>      

    </div>

  </form>

  

  <table class="table table-bordered table-striped">

    

    <thead>

      <tr>

        <td>

          <a ng-click="sortType = 'codigo_curso'; sortReverse = !sortReverse">

            Codigo

            <span ng-show="sortType == 'codigo_curso' && !sortReverse" class="fa fa-caret-down"></span>

            <span ng-show="sortType == 'codigo_curso' && sortReverse" class="fa fa-caret-up"></span>

          </a>

        </td>

        <td>

          <a ng-click="sortType = 'nombre_materia'; sortReverse = !sortReverse">

          Materia

            <span ng-show="sortType == 'nombre_materia' && !sortReverse" class="fa fa-caret-down"></span>

            <span ng-show="sortType == 'nombre_materia' && sortReverse" class="fa fa-caret-up"></span>

          </a>

        </td>

        <td>

          <a ng-click="sortType = 'numero_grupo'; sortReverse = !sortReverse">

          Grupo

            <span ng-show="sortType == 'numero_grupo' && !sortReverse" class="fa fa-caret-down"></span>

            <span ng-show="sortType == 'numero_grupo' && sortReverse" class="fa fa-caret-up"></span>

          </a>

        </td>
        
        <td>

          <a ng-click="sortType = 'creditos_curso'; sortReverse = !sortReverse">

          Creditos

            <span ng-show="sortType == 'creditos_curso' && !sortReverse" class="fa fa-caret-down"></span>

            <span ng-show="sortType == 'creditos_curso' && sortReverse" class="fa fa-caret-up"></span>

          </a>

        </td>

        <td>

          <a ng-click="sortType = 'horario'; sortReverse = !sortReverse">

          Horario

            <span ng-show="sortType == 'horario' && !sortReverse" class="fa fa-caret-down"></span>

            <span ng-show="sortType == 'horario' && sortReverse" class="fa fa-caret-up"></span>

          </a>

        </td>

         <td>

          <a ng-click="sortType = 'nombre_profesor'; sortReverse = !sortReverse">

          Profesor

            <span ng-show="sortType == 'nombre_profesor' && !sortReverse" class="fa fa-caret-down"></span>

            <span ng-show="sortType == 'nombre_profesor' && sortReverse" class="fa fa-caret-up"></span>

          </a>

        </td>

        <td>

          <a ng-click="sortType = 'cupo'; sortReverse = !sortReverse">

          Cupo

            <span ng-show="sortType == 'cupo' && !sortReverse" class="fa fa-caret-down"></span>

            <span ng-show="sortType == 'cupo' && sortReverse" class="fa fa-caret-up"></span>

          </a>

        </td>

        <td>

          <a ng-click="sortType = 'tipo_materia'; sortReverse = !sortReverse">

          Tipo

            <span ng-show="sortType == 'tipo_materia' && !sortReverse" class="fa fa-caret-down"></span>

            <span ng-show="sortType == 'tipo_materia' && sortReverse" class="fa fa-caret-up"></span>

          </a>

        </td>

          <td>

          <a ng-click="sortType = 'reservados'; sortReverse = !sortReverse">

          Reservados

            <span ng-show="sortType == 'reservados' && !sortReverse" class="fa fa-caret-down"></span>

            <span ng-show="sortType == 'reservados' && sortReverse" class="fa fa-caret-up"></span>

          </a>

        </td>

      </tr>

    </thead>

    

    <tbody>

      <tr ng-repeat="horario in resultQuery | orderBy:sortType:sortReverse | filter:search">

    <td>{{ horario.codigo_curso }}</td>   

    <td>{{ horario.nombre_materia }}</td>

    <td>{{ horario.numero_grupo }}</td>

    <td>{{ horario.creditos_curso }}</td>

    <td>{{ horario.horario }}</td>

    <td>{{ horario.nombre_profesor }}</td>

    <td>{{ horario.cupo }}</td>

    <td>{{ horario.tipo_materia }}</td>

    <td>{{ horario.reservados }}</td>

      </tr>

    </tbody>
  </table>
    

</div>








<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>



  <script src="node_modules/angular/angular.min.js"></script>


  <script src="resources/js/horarios.js"></script>


