<master>

<horarios>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">



<div class="container" ng-app="incursionApp" ng-controller="coordinadorController"> 

<!--<input type="button" class="button"    id="estadistica" value="Estadisticas">-->

<button class="btn"><i class="fa fa-download"></i> Descargar Reportes</button>

<br>
<br>

	<div class = "row">
		<div class="col">
	        <label for="modalidad_select">Seleccione la Modalidad</label>
			<select class="form-control" ng-model="inclusion.modalidades" ng-init="inclusion.modalidades = modalidadQuery[0]" ng-options="modalidad as modalidad.nombre_modalidad for modalidad in modalidadQuery track by modalidad.id_modalidad" ng-change="getPeriodos()" required>
			  <option value="">--Elige opcion--</option>
			</select>
	      	</div>

	      	<div class="col">
	        <label for="periodo_select">Seleccione la Periodo</label>
			<select class="form-control" ng-model="inclusion.periodos" ng-init="inclusion.periodos = periodoQuery[0]" ng-options="periodo as periodo.nombre_periodo for periodo in periodoQuery track by periodo.id_periodo" ng-change="getInclusionesEstudiantes()" required>
			  <option value="">--Elige opcion--</option>
			</select>
	      </div>
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
          <a ng-click="sortType = 'carne'; sortReverse = !sortReverse">
          Carné
            <span ng-show="sortType == 'carne' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'carne' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>

        <td>
          <a ng-click="sortType = 'estudiante_nombre'; sortReverse = !sortReverse">
          Nombre
            <span ng-show="sortType == 'estudiante_nombre' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'estudiante_nombre' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>

        <td>
          <a ng-click="sortType = 'curso_nombre'; sortReverse = !sortReverse">
          Curso
            <span ng-show="sortType == 'curso_nombre' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'curso_nombre' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>

        <td>
          <a ng-click="sortType = 'grupo_numero'; sortReverse = !sortReverse">
          Grupo
            <span ng-show="sortType == 'grupo_numero' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'grupo_numero' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>

       	<td>
          <a ng-click="sortType = 'estudiante_promedio'; sortReverse = !sortReverse">
          Promedio
            <span ng-show="sortType == 'estudiante_promedio' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'estudiante_promedio' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>
        
        <td>
          <a ng-click="sortType = 'estudiante_prioridad'; sortReverse = !sortReverse">
          Prioridad
            <span ng-show="sortType == 'estudiante_prioridad' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'estudiante_prioridad' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>
        <td>
          <a ng-click="sortType = 'estado'; sortReverse = !sortReverse">
          Estado
            <span ng-show="sortType == 'estado' && !sortReverse" class="fa fa-caret-down"></span>
            <span ng-show="sortType == 'estado' && sortReverse" class="fa fa-caret-up"></span>
          </a>
        </td>
      </tr>
    </thead>

    <button type="button" class="btn btn-success">Aceptar Inclusion</button>

    <button type="button" class="btn btn-warning">Pendiente</button>

    <button type="button" class="btn btn-danger">Rechazar Inclusion</button>
    
    <tbody>
      <tr ng-repeat="inclusion in resultQuery | orderBy:sortType:sortReverse | filter:search">
        <td>{{ inclusion.carne }}</td>
		<td>{{ inclusion.estudiante_nombre }}</td>
		<td>{{ inclusion.curso_nombre }}</td>
		<td>{{ inclusion.grupo_numero }}</td>
		<td>{{ inclusion.estudiante_promedio }}</td>
		<td>{{ inclusion.estudiante_prioridad }}</td>
		<td>{{ inclusion.estado }}</td>
      </tr>
    </tbody>
    
  </table> 
	   

</div>












<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>



	<script src="node_modules/angular/angular.min.js"></script>

 
	<script src="resources/js/coordinador.js"></script>





 
	