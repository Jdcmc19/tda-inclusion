<master>


	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">




<div class="container" ng-app="incursionApp" > 

	    <!--Falta configuar el boton de refresh y agregar el controler-->


	    

     <table id="table1" class="table table-striped table-bordered table-sm" cellspacing="0" width="100%">
  		<thead>
		      <tr>
		        <th scope="col">Sede</th>
		        <th scope="col">Escuela</th>
		        <th scope="col">Curso</th>
		        <th scope="col">Grupo</th>
		        <th scope="col">Accion</th>
		      </tr>
		    </thead>
		    <tbody>
		      <tr ng-repeat="inclusion in resultQuery">
		        <td>{{ inclusion.sede_nombre }}</td>
		        <td>{{ inclusion.escuela_nombre}}</td>
		        <td>{{ inclusion.curso_nombre }}</td>
		        <td>{{ inclusion.grupo_numero }}</td>
		        <td>{{ inclusion.estado }}</td>

		      </tr>

		     


		    </tbody>
		</table>

</div>




 <script src="node_modules/tablefilter/dist/tablefilter/tablefilter.js"></script>











<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>



	<script src="node_modules/angular/angular.min.js"></script>

 
	<script src="resources/js/estudiante.js"></script>

