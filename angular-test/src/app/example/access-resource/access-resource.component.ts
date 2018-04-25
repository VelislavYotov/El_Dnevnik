import { Component, OnInit } from '@angular/core';

import { Angular2TokenService } from 'angular2-token';

@Component({
    selector: 'access-resource',
    templateUrl: 'access-resource.component.html'
})
export class AccessResourceComponent {

    output: any;

    constructor(private _tokenService: Angular2TokenService) {}

    // Submit Data to Backend
    onSubmit() {

        this.output = null;

        this._tokenService.get('subjects').subscribe(
            res => this.output      = res,
            error => this.output    = error
        );
    }
}
