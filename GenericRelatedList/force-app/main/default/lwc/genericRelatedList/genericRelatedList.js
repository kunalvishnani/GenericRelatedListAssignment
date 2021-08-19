import { LightningElement,api} from 'lwc';
import fetchRecords from '@salesforce/apex/GenericRelatedListController.fetchRecords';
export default class GenericRelatedList extends LightningElement 
{
    @api objectName; 
    @api recordId;  
    @api relation;
    @api field;
    @api filters;
    error;
    isLoaded = true; // for spinner
    data;
    fields = [];
    columns = [];
    icon;
    connectedCallback()
    {
        //set name of icon object
        this.icon = 'standard:'+this.objectName;

        //if fields are available then it will add add fields to columns
        if(this.field != null)
        {
            this.fields = this.field.split(',');

            for(var i=0;i<this.fields.length ; i++)
            {
                this.columns.push({label : this.fields[i] , fieldName : this.fields[i]});
            }
            //spinner check variable
            this.isLoaded  = true;
            this.fetchData();
        }
    }

    fetchData()
    {
        //method for getting data from apex controller
        fetchRecords({objectName : this.objectName , fields : this.field , relation : this.relation , recordId : this.recordId , filter : this.filters})
            .then(result => {
                this.isLoaded = false;
                this.data = result;
                console.log(result)
            })
            .catch(error => {
                this.isLoaded = false;
                this.error = error.body.message;
                //alert(error);
            });
    }
    
}