import { LightningElement, wire } from 'lwc';
import getCriteriaValues from '@salesforce/apex/getPicklistController.getCriteriaValues';
import addRecordMethod from '@salesforce/apex/createRecord.addRecordMethod';
import { ShowToastEvent } from "lightning/platformShowToastEvent";

export default class AddRecordComponent extends LightningElement {

    criteriaValues = [];
    name;
    email;
    criteria;

    @wire(getCriteriaValues)
    wiredGetCriteriaValues({ error, data }) {
        if (data) {
            this.criteriaValues = data;
            console.log(this.criteriaValues);
        }
        if (error) {
            console.error('error---->', error);
        }
    }

    handleName(event) {
        this.name = event.target.value;
    }
    handleEmail(event) {
        this.email = event.target.value;
    }
    handleCriteria(event) {
        this.criteria = event.target.value;
    }
    handleSaveButton() {
    addRecordMethod({
        name: this.name,
        email: this.email,
        criteria: this.criteria
    })
    .then(() => {
        alert("Record created successfully, check email");
        this.name = '';
        this.email = '';
        this.criteriaValues = [];
    })
    .catch(error => {
        console.error('error--->', error);
        alert("Record cannot be saved. Please try again later.");
         this.criteriaValues = [];
    });
}

}
