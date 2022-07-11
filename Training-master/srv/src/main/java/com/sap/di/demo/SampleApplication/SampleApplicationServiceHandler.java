package com.sap.di.demo.SampleApplication;

import com.sap.cds.Result;
import javax.annotation.Resource;
import com.sap.cds.services.cds.CdsCreateEventContext;
import org.springframework.beans.factory.annotation.Autowired;
import com.sap.cds.services.handler.EventHandler;
import com.sap.cds.services.cds.CdsService;
import com.sap.cds.services.handler.annotations.On;
import com.sap.cds.services.handler.annotations.After;
import com.sap.cds.services.handler.annotations.Before;
import com.sap.cds.services.handler.annotations.ServiceName;
import org.springframework.stereotype.Component;
import com.sap.cds.services.draft.DraftService;
import cds.gen.employeesservice.EmployeesService_;
import cds.gen.employeesservice.Employees;
import cds.gen.employeesservice.Employees_;
import java.time.LocalDate;
import com.sap.cds.services.messages.Messages;
import com.sap.cds.ql.Select;
import com.sap.cds.services.ServiceException;
import com.sap.cds.services.ErrorStatuses;
import java.util.stream.Stream;
import com.sap.cds.services.persistence.PersistenceService;

@Component
@ServiceName(EmployeesService_.CDS_NAME)
public class SampleApplicationServiceHandler implements EventHandler {
    @Resource(name = EmployeesService_.CDS_NAME)
    @Autowired
    private DraftService employeesservice;
    @Autowired
    Messages messages;
    @Autowired
    PersistenceService db;

    @Before(event = DraftService.EVENT_DRAFT_NEW, entity = Employees_.CDS_NAME)
    public void beforeEmployeeDraftCreation(Employees employee) {
        employee.setStatusId(2);
    }

    @Before(event = DraftService.EVENT_DRAFT_PATCH, entity = Employees_.CDS_NAME)
    public void beforeEmployeeDraftUpdation(Employees employee) {

    }

    @Before(event = CdsService.EVENT_CREATE, entity = Employees_.CDS_NAME)
    public void beforeEmployeeCreate(Employees employee) {
        if(employee.getBirthDate() != null && employee.getBirthDate().compareTo( LocalDate.now()) > 0){
            messages.error("Date greater than today").target("in", Employees_.class, emp -> emp.birthDate());
            throw new ServiceException(ErrorStatuses.BAD_REQUEST, "Following Error Occurred :").messageTarget("in", Employees_.class,  emp -> emp.ID());
        }
    }

    @On(event = CdsService.EVENT_CREATE, entity = Employees_.CDS_NAME)
    public void onEmployeeCreate(Employees employee) {
        Result aEmployee = db.run(Select.from(Employees_.class));
        employee.setIdentifier(aEmployee.first().isPresent() ? (aEmployee.list().size() + 1) : 1);
    }

    @After(event = CdsService.EVENT_CREATE, entity = Employees_.CDS_NAME)
    public void afterEmployeeCreate(CdsCreateEventContext context) {
    }

    @After(event = { CdsService.EVENT_READ, CdsService.EVENT_UPDATE, CdsService.EVENT_UPSERT })
    public void afterEmployeeRead(Stream<Employees> employees) {
        employees.forEach(b -> {
            if (b.getIsActiveEntity() != null && b.getHasDraftEntity() != null && b.getStatusId() != null) {
                b.setIsActive(b.getStatusId().equals(3) && b.getIsActiveEntity() && !b.getHasDraftEntity());
                b.setIsInActive(
                (b.getStatusId().equals(0) ||b.getStatusId().equals(2) )&& b.getIsActiveEntity() && !b.getHasDraftEntity());
                b.setIsHideActivateButton(b.getIsActiveEntity() ? b.getIsActive() : !b.getIsActiveEntity());
                b.setIsHideDeactivateButton(b.getIsActiveEntity() ? b.getIsInActive() : !b.getIsActiveEntity());
            }
        });
    }
}
