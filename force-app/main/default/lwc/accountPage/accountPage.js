
//Source org

import { LightningElement } from 'lwc';

const actions = [
    { label: 'Show details', name: 'show_details' },
    { label: 'Delete', name: 'delete' },
];

const columns = [
    { label: 'Name', fieldName: 'name' },
    { label: 'Website', fieldName: 'website', type: 'url' },
    { label: 'Phone', fieldName: 'phone', type: 'phone' },
    { label: 'Balance', fieldName: 'amount', type: 'currency' },
    { label: 'Close At', fieldName: 'closeAt', type: 'date' },
    {
        type: 'action',
        typeAttributes: { rowActions: actions },
    },
];
export default class AccountPage extends LightningElement {
    data = [];
    columns = columns;
    record = {};

    async connectedCallback() {
        // this.data = generateData({ amountOfRecords: 100 });
        this.getItems();
    }

    handleRowAction(event) {
        const actionName = event.detail.action.name;
        const row = event.detail.row;
        switch (actionName) {
            case 'delete':
                this.deleteRow(row);
                break;
            case 'show_details':
                this.showRowDetails(row);
                break;
            default:
        }
    }

    deleteRow(row) {
        const { id } = row;
        const index = this.findRowIndexById(id);
        if (index !== -1) {
            this.data = this.data
                .slice(0, index)
                .concat(this.data.slice(index + 1));
        }
    }

    findRowIndexById(id) {
        let ret = -1;
        this.data.some((row, index) => {
            if (row.id === id) {
                ret = index;
                return true;
            }
            return false;
        });
        return ret;
    }

    showRowDetails(row) {
        this.record = row;
    }

    async getItems() {
        try {
          const response = await fetch("callout:myCred/services/apexrest/Account/");
          if (!response.ok) {
            throw Error(response);
          }
          const myItems = await response.json();
          console.log(JSON.stringify(myItems));
        } catch (error) {
          console.error("There's a problem with your fetch operation:", error);
        } finally {
          // do something regardless of whether the operation was successful
        }
      }
}