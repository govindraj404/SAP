sap.ui.define(["sap/ui/core/mvc/ControllerExtension"],
 function (
	ControllerExtension
) {
	"use strict";
	 return ControllerExtension.extend("demo.employee.OPExtend", {
		onPageDataLoad: function () {
			var a;
			this.base.getAppComponent();
		},
		override: {
			onInit: function () {
				var a;
			},
			onPageReady: function (mParameters) {
				var a;
				
			},
			
			onAfterRendering: function () {
				var a;
			}
		}
	});
});