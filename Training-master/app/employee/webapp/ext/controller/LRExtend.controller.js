sap.ui.define(["sap/ui/core/mvc/ControllerExtension"],
 function (
	ControllerExtension
) {
	"use strict";
	return ControllerExtension.extend("demo.employee.LRExtend", {
		override: {
			onInit: function () {
				var a;
			},
			onAfterRendering: function () {
				var a;
			},
			routing: {
				onBeforeNavigation: function (oContextInfo) {
					var a;                                                  
				}
			}
		}
	});
});