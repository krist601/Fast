<%@ page import="fastchacaito.Appointment" %>

<div class="par">
    <label>Hora de la Cita</label>
    <div class="input-append bootstrap-timepicker">
        <input id="timepicker1" name="time" type="text" class="input-small" required/>
        <span class="add-on"><i class="iconfa-time"></i></span>
    </div>
</div>

<div class="fieldcontain ${hasErrors(bean: appointmentInstance, field: 'date', 'error')} ">
    <label>Fecha de la Cita</label>
    <span class="field"><input id="datepicker" type="text" name="date" class="input-small" required/></span>
</div>

</br>

<div class="fieldcontain ${hasErrors(bean: appointmentInstance, field: 'treatment', 'error')} required">
    <label for="treatment">
        <g:message code="appointment.treatment.label" default="Tratamiento" />
    </label>
    <g:select id="treatment" name="treatment.id" from="${fastchacaito.Treatment.findAllByPatient(patientInstance)}" optionKey="id" required="" value="${appointmentInstance?.treatment?.id}" class="many-to-one" noSelection="['':'-Selecciona-']"/>
</div>

