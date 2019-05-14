	<master>


		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
		

	<div class="container" ng-app="incursionApp" ng-controller="cerradosController"> 

		
	
		
    <nav class="navbar navbar-expand-lg navbar navbar-dark bg-primary">
      </button>
      <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <div class="navbar-nav">
          <a class="nav-item nav-link " href="http://localhost:8000/tda-inclusion/coordinador">Inclusiones </a>
          <a class="nav-item nav-link active" >Abrir/Cerrar Cursos<span class="sr-only">(current)</span></a>
          <a class="nav-item nav-link" href="http://localhost:8000/tda-inclusion/estadisticas">Estadisticas</a>
        </div>
      </div>
    </nav>

	   

		<form>
		  <div class="form-group">
		  	<input type="hidden"  ng-model="inclusion.user_id" id="user_id" name="user_id" value= "@user_id@" >



		  	

	      	<div class="form-group">
	        <label for="modalidad_select">Seleccione la Modalidad</label>
			<select class="form-control" ng-model="inclusion.modalidades" ng-init="inclusion.modalidades = modalidadQuery[0]" ng-options="modalidad as modalidad.nombre_modalidad for modalidad in modalidadQuery track by modalidad.id_modalidad" ng-change="getPeriodos()" required>
			  <option value="">--Elige opcion--</option>
			</select>
	      	</div>

	      	<div class="form-group">
	        <label for="periodo_select">Seleccione el Periodo</label>
			<select class="form-control" ng-model="inclusion.periodos" ng-init="inclusion.periodos = periodoQuery[0]" ng-options="periodo as periodo.nombre_periodo for periodo in periodoQuery track by periodo.id_periodo" ng-change="getSedes()" required>
			  <option value="">--Elige opcion--</option>
			</select>
	      </div>

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
			<select id= "Escuelas" name="Escuelas" class="form-control" ng-model="inclusion.escuelaSeleccionada" ng-init="inclusion.escuelaSeleccionada = escuelaQuery[0]" ng-options="escuela as escuela.nombre_escuela for escuela in escuelaQuery track by escuela.id_escuela" ng-change="getCursos()" required >
			  <option value="">--Elige opcion--</option>
			</select>
	          <!--<pre> {{ escuelaQuery | json }} </pre>
	          <pre> {{ escuelaSeleccionada }} </pre>-->
	      </div>





	      <div class="form-group">
	          <label for="curso_select">Seleccione el Curso</label>
			<select id= "Cursos" name="Cursos" class="form-control" ng-model="inclusion.cursoSeleccionada" ng-init="inclusion.cursoSeleccionada = cursoQuery[0]" ng-options="curso as curso.nombre_curso for curso in cursoQuery track by curso.id_curso" ng-change="getGrupos()" required>
			  <option value="">--Elige opcion--</option>
			</select>
	          <!--<pre> {{ cursoQuery | json }} </pre>
	          <pre> {{ cursoSeleccionada }} </pre>-->
	      </div>


			<div class="form-group">
	          <label for="grupo_select">Seleccione el Grupo</label>
			<select id= "Grupos" name="Grupos" class="form-control" ng-model="inclusion.grupoSeleccionada" ng-init="inclusion.grupoSeleccionada = grupoQuery[0]" ng-options="grupo as grupo.numero_grupo for grupo in grupoQuery track by grupo.id_grupo" ng-change="" required>
			  <option value="">--Elige opcion--</option>
			</select>
	          <!--<pre> {{ grupoQuery | json }} </pre>
	          <pre> {{ inclusion }} </pre>-->
	      </div>




		  </div>
		  <button class="btn btn-danger" type="button" ng-click="grupos(1)" >Cerrar Grupo</button><button style="float: right" class="btn btn-success" type="button" ng-click="grupos(2)" >Abrir Grupo</button>
		</form>


	          




	
	</div>





	<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>



		<script src="node_modules/angular/angular.min.js"></script>

		<script src="resources/js/cerrados.js"></script>