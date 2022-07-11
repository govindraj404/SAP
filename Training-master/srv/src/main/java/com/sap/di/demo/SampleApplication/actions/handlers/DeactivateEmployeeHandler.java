package com.sap.di.demo.SampleApplication.actions.handlers;

import com.sap.cds.services.handler.EventHandler;
import com.sap.cds.Struct;
import com.sap.cds.ql.Update;
import com.sap.cds.ql.cqn.CqnSelect;
import com.sap.cds.ql.cqn.CqnUpdate;
import com.sap.cds.services.cds.CdsService;
import com.sap.cds.services.handler.annotations.On;
import com.sap.cds.services.handler.annotations.ServiceName;
import com.sap.cds.services.messages.Messages;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.annotation.RequestScope;
import com.sap.di.demo.SampleApplication.actions.context.DeactivateContext;
import cds.gen.employeesservice.EmployeesService_;
import cds.gen.employeesservice.Employees;
import cds.gen.employeesservice.Employees_;
import com.sap.cds.services.persistence.PersistenceService;

@RequestScope
@Component
@ServiceName(EmployeesService_.CDS_NAME)
public class DeactivateEmployeeHandler implements EventHandler {
    @Autowired
    Messages messages;
    @Autowired
    PersistenceService db;

    @On(entity = Employees_.CDS_NAME)
    public void Activate(final DeactivateContext context) {
        CqnSelect select = context.getCqn();
        Employees employee = ((CdsService) context.getService()).run(select)
                .single(Employees.class);
        if (employee.getIsActiveEntity()) {
            Employees employeeToBeUpdated = Struct.create(Employees.class);
            employeeToBeUpdated.setStatusId(0);
            CqnUpdate update = Update.entity(Employees_.class).data(employeeToBeUpdated)
                    .where(b -> b.ID().eq(employee.getId()));
            db.run(update);

            employee.setStatusId(0);
            employee.setIsActive(false);
            employee.setIsInActive(true);
            employee.setIsHideActivateButton(false);
            employee.setIsHideDeactivateButton(true);
            
            messages.success("Deactivation Succesful");
        } else {
            messages.success("Draft Record");
        }
        context.setResult(employee);
        context.setCompleted();
    }
}