package com.sap.di.demo.SampleApplication.actions.context;

import com.sap.cds.services.EventContext;
import com.sap.cds.services.EventName;
import com.sap.cds.ql.cqn.CqnSelect;
import com.sap.cds.services.cds.CdsService;
import cds.gen.employeesservice.Employees;

@EventName("Deactivate")
public interface DeactivateContext extends EventContext {
  CqnSelect getCqn();

  CdsService getService();

  void setResult(Employees employee);

  void setCompleted();
}
