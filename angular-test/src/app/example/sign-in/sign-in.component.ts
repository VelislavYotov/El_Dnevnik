import { Component, OnInit } from '@angular/core';
import { Angular2TokenService, SignInData } from 'angular2-token';

@Component({
    selector: 'sign-in',
    templateUrl: 'sign-in.component.html'
})
export class SignInComponent {

    signInData: SignInData = <SignInData>{};
    output: any;

    constructor(private _tokenService: Angular2TokenService) {}
    login(userType) {
      this.output = null;
      this.signInData.userType = userType;
      this._tokenService.signIn(this.signInData).subscribe(
          res => {
              this.signInData     = <SignInData>{};
              this.output         = res;
          }, error => {
              this.signInData     = <SignInData>{};
              this.output         = error;

          }
      );
    }
    // Submit Data to Backend
    onSubmit() {

    this.login("STUDENT");
  //  this.login("TEACHER");
  //  this.login("STUDENT");

    }
}
