import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppComponent } from './app.component';
import { UserComponent } from './user/user.component';
import { GradesComponent } from './grades/grades.component';
import { RouterModule, Routes} from '@angular/router';


@NgModule({
  declarations: [
    AppComponent,
    UserComponent,
    GradesComponent
  ],
  imports: [
  BrowserModule,
  RouterModule.forRoot([
    {path:'user', component: UserComponent},
    {path:'grades', component: GradesComponent}
    ]),
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
