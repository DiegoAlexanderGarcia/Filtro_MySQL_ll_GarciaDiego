-- 1.Encuentra el profesor que ha impartido más asignaturas en el último año académico.
SELECT * FROM el_univercitario.asignatura;
select profesor.nombre, count(asignatura.id) asignatura from asignatura 
inner join profesor on profesor.id = asignatura.id_profesor
group by nombre 
order by 1
limit 1
;

-- 2.Lista los cinco departamentos con mayor cantidad de asignaturas asignadas.
select * from profesor;
select d.nombre, asignatura.id from asignatura 
inner join profesor on asignatura.id_profesor = profesor.id
inner join departamento d on profesor.id_departamento = d.id 
limit 5;

-- 3.Obtén el total de alumnos y docentes por departamento.

select count(alumno.id) alumnos, count(profesor.id) docentes, departamento.id departamento from  alumno
right join alumno_se_matricula_asignatura on alumno.id = alumno_se_matricula_asignatura.id_alumno
right join asignatura on alumno_se_matricula_asignatura.id_asignatura = asignatura.id
right join profesor on asignatura.id_profesor = profesor.id
right join departamento on profesor.id_departamento = departamento.id
group by departamento
;


-- 4.Calcula el número total de alumnos matriculados en asignaturas de un género específico en un semestre determinado.
select count(alumno.id), alumno.sexo, asignatura.id asignatura from alumno
inner join alumno_se_matricula_asignatura on alumno.id = alumno_se_matricula_asignatura.id_asignatura
inner join asignatura on alumno_se_matricula_asignatura.id_asignatura = asignatura.id
group by asignatura;

-- 5.Encuentra los alumnos que han cursado todas las asignaturas de un grado específico.
select alumno.nombre, grado.id from alumno
inner join alumno_se_matricula_asignatura on alumno.id = alumno_se_matricula_asignatura.id_asignatura
inner join asignatura on alumno_se_matricula_asignatura.id_asignatura = asignatura.id
inner join grado on asignatura.id_grado = grado.id
group by nombre, id;

-- 6.Lista los tres grados con mayor número de asignaturas cursadas en el último semestre.
select grado.nombre from grado
inner join asignatura on grado.id = asignatura.id_grado
group by nombre; 

-- 7.Muestra los cinco profesores con menos asignaturas impartidas en el último año académico.
select profesor.nombre from curso_escolar
inner join alumno_se_matricula_asignatura on curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar
inner join asignatura on alumno_se_matricula_asignatura.id_asignatura = asignatura.id
inner join profesor on asignatura.id_profesor = profesor.id


-- Calcula el promedio de edad de los alumnos al momento de su primera matrícula.
-- Encuentra los cinco profesores que han impartido más clases de un mismo grado.
-- Genera un informe con los alumnos que han cursado más de 10 asignaturas en el último año.
-- Calcula el promedio de créditos de las asignaturas por grado.
-- Lista las cinco asignaturas más largas (en horas) impartidas en el último semestre.
-- Muestra los alumnos que han cursado más asignaturas de un género específico.
-- Encuentra la cantidad total de horas cursadas por cada alumno en el último semestre.
-- Muestra el número de asignaturas impartidas diariamente en cada mes del último trimestre.
-- Calcula el total de asignaturas impartidas por cada profesor en el último semestre.
-- Encuentra al alumno con la matrícula más reciente.
-- Lista los cinco grados con mayor número de alumnos matriculados durante los últimos tres meses.
-- Obtén la cantidad de asignaturas cursadas por cada alumno en el último semestre.
-- Lista los profesores que no han impartido clases en el último año académico.


