sap.ui.define(["sap/m/MessageBox","sap/m/MessageToast", "sap/ui/model/json/JSONModel"], function(MessageBox, MessageToast, JSONModel) {
	"use strict";
	return {
		onNavigationAction: function (oContext, aSelectedContexts) {
			MessageToast.show("Button Pressed");
            var oParams = { preferredMode: "create" };
            this.intentBasedNavigation.navigateOutbound("SampleProject",oParams);
			}
		}
});