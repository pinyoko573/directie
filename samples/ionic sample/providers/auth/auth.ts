import { Injectable } from '@angular/core';
import { AngularFireAuth } from 'angularfire2/auth';
import { AngularFireDatabase } from 'angularfire2/database';
import { Observable } from "rxjs/Observable";
import { Platform } from 'ionic-angular';
import { Facebook } from '@ionic-native/facebook';
import { GooglePlus } from '@ionic-native/google-plus';
// import { auth } from 'firebase'; //needed for the FacebookAuthProvider

import firebase from 'firebase/app';

import { Global } from '../../global';

import 'rxjs/add/operator/take'


@Injectable()
export class AuthProvider {

  constructor(
    public afAuth: AngularFireAuth,
    public afDatabase: AngularFireDatabase,
    private global: Global,
    private platform: Platform,
    private fb: Facebook,
    private google: GooglePlus
  ) { }

  /**
   * loginUser takes in an email and password and signs the user into the application.
   */
  loginUser(email: string, password: string): firebase.Promise<any> {
    return this.afAuth.auth.signInWithEmailAndPassword(email, password);
  }

  loginGoogle() {
    // return this.afAuth.auth.signInWithCredential()
    return this.afAuth.auth.signInWithRedirect(new firebase.auth.GoogleAuthProvider());
  }

  loginFB() {
    return this.afAuth.auth.signInWithRedirect(new firebase.auth.FacebookAuthProvider());
  }

  loginWithFacebook(): Promise<any> {
    return new Promise((resolve, reject) => {
      if (this.platform.is('cordova')) {
        this.fb.login(['email', 'public_profile']).then(res => {
          console.dir(res);
          // res.authResponse.userID
          const facebookCredential = firebase.auth.FacebookAuthProvider.credential(res.authResponse.accessToken);
          this.afAuth.auth.signInWithCredential(facebookCredential).then((data) => {
            console.dir(data);
            this.global.userid = data.uid;
            this.checkUser(data).then(user => {
              console.dir(user);
            });
            resolve(data);
          }).catch(error => {
            //console.log(error);
            // observer.error(error);
            reject(error);
          });
        }).catch(error => {
          reject(error);
        });
      } else {
        // return this.afAuth.auth..login({
        //   provider: AuthProviders.Facebook,
        //   method: AuthMethods.Popup
        //   }).then(()=>{
        //     observer.next();
        //   }).catch(error => {
        //     //console.log(error);
        //     observer.error(error);
        // });
        console.error('This application needs to run on a device');
      }
    });
  }

  loginWithGoogle() {
    return new Promise((resolve, reject) => {
      if (this.platform.is('cordova')) {
        this.google.login({
          'webClientId': '828576068400-uruk76cku7jsjo15ramm9bavp3b7d45k.apps.googleusercontent.com', // optional clientId of your Web application from Credentials settings of your project - On Android, this MUST be included to get an idToken. On iOS, it is not required.
          'offline': true
        }).then(res => {
          // console.dir(res);
          // console.log(res.idToken);
          var googleCredential = firebase.auth.GoogleAuthProvider.credential(res.idToken);
          // console.dir(googleCredential);
          this.afAuth.auth.signInWithCredential(googleCredential).then((data) => {
            // console.dir(data);
            this.global.userid = data.uid;
            this.checkUser(data).then(user => {
              // console.dir(user);
            }).catch(error => {
              console.error(error);
              reject(error);
            });
            resolve(data);
          }).catch(error => {
            console.error(error);
            reject(error);
          });
        }).catch(error => {
          console.error(error);
          reject(error);
        });
      } else {
        console.error('This application needs to run on a device');
      }
    })
  }
  checkUser(data) {
    return new Promise((resolve) => {
      console.log('checkUser');
      let profile = this.afDatabase.object('/userProfile/' + data.uid, { preserveSnapshot: true }).subscribe(profile => {
        console.log("subscribe");
        console.dir(profile);
        if (profile.val()) {
          console.log('got data')
          console.dir(profile.val());
        } else {
          console.log("no data");
          this.afDatabase.object('/userProfile/' + data.uid).set({
            email: data.email,
            name: data.displayName,
            image: data.photoURL,
            gender: "",
            school: 0,
            imageName: ""
          });
        }
        resolve(profile);

      });
    })
    // console.log("profile");
    // console.dir(profile);


    //   this.getUser(uid).then((data) => {
    //     console.log('getUser with data');
    //     console.dir(data);
    //     if (data != null) {
    //       console.log("no data");
    //     }
    //     else {
    //       console.log("got data");
    //       this.afDatabase.object('/userProfile/' + data.uid).set({
    //         email: data.email,
    //         name: data.displayName,
    //         image: data.photoURL,
    //         gender: "",
    //         school: ""
    //       });
    //     }
    //   });
    // }
    // getUser(uid) {
    //   return this.afDatabase.object('/userProfile/' + uid).toPromise();
  }

  /**
   * signupUser takes in an email and password and does 3 things:
   * 1. It creates the new user.
   * 2. It signs the user into the application.
   * 3. It creates a database node for the user to store the userProfile, which starts with just
   *    the email address.
   */
  signupUser(email: string, password: string, name: string): firebase.Promise<any> {
    return this.afAuth.auth.createUserWithEmailAndPassword(email, password).then((newUser) => {
      console.log('creating user');
      console.dir(newUser);
      console.log(newUser.uid);
      this.global.userid = newUser.uid;
      this.afDatabase.object(`/userProfile/${newUser.uid}`).set({
        email: email,
        name: name,
        image: "https://firebasestorage.googleapis.com/v0/b/phoro-89a96.appspot.com/o/images%2Fdefault.jpg?alt=media&token=accd05ef-ed1f-44fc-96b4-7e9d9376db1f",
        gender: "",
        school: 0,
        imageName: ""
      });
      console.log(this.global.userid);
    });
  }



  /**
   * resetPassword takes the email address as a string and sends the email with the reset password 
   * link.
   */
  resetPassword(email: string): firebase.Promise<any> {
    return this.afAuth.auth.sendPasswordResetEmail(email);
  }

  /**
   * logoutUser doesn't take any parameters, it looks into the authentication object and signs out
   * the currently logged in user.
   */
  logoutUser(): firebase.Promise<any> {
    if (this.global.signin_provider == "google") {
      this.google.disconnect();
    } else if (this.global.signin_provider == "facebook") {
      this.fb.logout();
    }
    return this.afAuth.auth.signOut();
  }


}
