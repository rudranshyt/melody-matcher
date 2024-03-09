import { LightningElement } from 'lwc';
import { NavigationMixin } from "lightning/navigation";

export default class HomePageComponent extends NavigationMixin(LightningElement) {
    handleClickButton() {
        const pageReference = {
            type: "standard__webPage",
            attributes: {
                url: "/add-record"
            }
        };
        this[NavigationMixin.Navigate](pageReference);
    }
}