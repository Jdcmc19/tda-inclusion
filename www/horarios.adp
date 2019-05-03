<master>


	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
  






<div class="container" ng-app="incursionApp" ng-controller="horariosController"> 

	    <!--Falta configuar el boton de refresh (refreshTable())y agregar los filtros y cada columna correspondiente

		<button class="btn btn-primary"><span class="glyphicon glyphicon-refresh"></span> Actualizar</button>-->

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
			<select id= "Escuelas" name="Escuelas" class="form-control" ng-model="inclusion.escuelaSeleccionada" ng-init="inclusion.escuelaSeleccionada = escuelaQuery[0]" ng-options="escuela as escuela.nombre_escuela for escuela in escuelaQuery track by escuela.id_escuela" ng-change="ĺoadTable()" required >
			  <option value="">--Elige opcion--</option>
			</select>
	          <!--<pre> {{ escuelaQuery | json }} </pre>
	          <pre> {{ escuelaSeleccionada }} </pre>-->
	      </div>

	  

     <br>
     <div>
     <table id="example" class="table table-striped table-bordered table-sm" cellspacing="0" width="100%" >
  		<thead>
		      <tr>
		        <th scope="col">Codigo</th>
		        <th scope="col">Materia</th>
		        <th scope="col">Grupo</th>
		        <th scope="col">Creditos</th>
		        <th scope="col">Horario</th>
		        <th scope="col">Profesor</th>
		        <th scope="col">Cupo</th>
		        <th scope="col">Tipo Materia</th>
		        <th scope="col">Reservados</th>
		      </tr>
		    </thead>
		    <tbody>
		      <tr ng-repeat="horario in resultQuery">
		        <td>{{ horario. }}</td>   <!--los nombres despues de horario dependen de juan de de como los traiga en en el json-->
		        <td>{{ horario. }}</td>
		        <td>{{ horario. }}</td>
		        <td>{{ horario. }}</td>
		        <td>{{ horario. }}</td>
		        <td>{{ horario. }}</td>
		        <td>{{ horario. }}</td>
		        <td>{{ horario. }}</td>
		        <td>{{ horario. }}</td>
		      </tr>
		    </tbody>
		</table>
        </div>

</div>






<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>



	<script src="node_modules/angular/angular.min.js"></script>

 
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>

	<script src="resources/js/horarios.js"></script>


