import { Test } from './../../models/testModel';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class TestService {

  private baseUrl = "http://localhost:8089/project2024/api/v1/test";

  constructor(private http:HttpClient) { }


  addTestToPost(data: Test, postId:any): Observable<Test> {
 
    return this.http.post<Test>(`${this.baseUrl}/${postId}`, data);

  }
  getAllTest(): Observable<Test[]> { // Correction : Ajout du type de retour Observable<Course[]>
    return this.http.get<Test[]>(`${this.baseUrl}`); // Correction : Préciser le type de retour
  }

  getTestsByPostId(postId:any): Observable<Test[]> { // Correction : Ajout du type de retour Observable<Course[]>
    return this.http.get<Test[]>(`${this.baseUrl}/getPost/${postId}`); // Correction : Préciser le type de retour
  }
  getTestById(testId: any): Observable<Test> {
    return this. http.get<Test>(`${this.baseUrl}/${testId}`);
  }
  updateTest(testId: any, data: Test): Observable<Test> {
    return this. http.put<Test>(`${this.baseUrl}/${testId}`, data);

  }
  public deleteTest(testId: any): Observable<void> {
    return this.http.delete<void>(`${this.baseUrl}/${testId}`);
  }

}
