import { Post } from './../../models/postModel';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class PostService {

  private baseUrl = "http://localhost:8089/project2024/api/v1/post";

  constructor(private http:HttpClient) { }


  addPostToCompany(data: Post, id:any): Observable<Post> {
 
    return this.http.post<Post>(`${this.baseUrl}/${id}`, data);

  }
  getAllPost(): Observable<Post[]> { // Correction : Ajout du type de retour Observable<Course[]>
    return this.http.get<Post[]>(`${this.baseUrl}`); // Correction : Préciser le type de retour
  }
  getPostById(postId: any): Observable<Post> {
    return this. http.get<Post>(`${this.baseUrl}/${postId}`);
  }
  updatePost(postId: any, data: Post): Observable<Post> {
    return this. http.put<Post>(`${this.baseUrl}/${postId}`, data);

  }
  public deletePost(postId: any): Observable<void> {
    return this.http.delete<void>(`${this.baseUrl}/${postId}`);
  }

}
