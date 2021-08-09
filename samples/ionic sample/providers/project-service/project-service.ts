import { Injectable } from '@angular/core';
import { Http } from '@angular/http';
import 'rxjs/add/operator/map';

@Injectable()
export class ProjectServiceProvider {

  project_data: any;
  projectapi_Url = 'http://ec2-54-179-182-168.ap-southeast-1.compute.amazonaws.com/myapi/api/projects/getall';
  byprojectid_api_Url = 'http://ec2-54-179-182-168.ap-southeast-1.compute.amazonaws.com/mapi/api/exhibits/';
  byeventid_api_Url = 'http://ec2-54-179-182-168.ap-southeast-1.compute.amazonaws.com/mapi/api/exhibits/getbyeventid/';

  constructor(public http: Http) {
    console.log('Hello ProjectServiceProvider Provider'); 
  } //end constructor

  getProjects() {
      if (this.project_data) {
        return Promise.resolve(this.project_data);
      }

      return new Promise(resolve => {
        this.http.get(this.projectapi_Url)
          .map(res => res.json())
          .subscribe(data => {
            this.project_data = data;
            resolve(this.project_data);
          });
      });
  } //end getProjects()


  getProjectByProjectId(projectid) {

      return new Promise(resolve => {
        let url = this.byprojectid_api_Url + projectid;
        //console.log("Getting project info at: " + url)
        this.http.get(url)
          .map(res => res.json())
          .subscribe(data => {
            this.project_data = data;
            resolve(this.project_data);
            
          });
      });
  } //end getProjectByProjectId()

   getProjectsByEventId(eventid) {

      return new Promise(resolve => {
        let url = this.byeventid_api_Url + eventid;
          this.http.get(url)
          .map(res => res.json())
          .subscribe(data => {
            this.project_data = data;
            resolve(this.project_data);
            
          });
      });
  } //end getProjectByProjectId()

} //end class
