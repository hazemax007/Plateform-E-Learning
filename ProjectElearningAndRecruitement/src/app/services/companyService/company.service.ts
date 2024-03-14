import { Company } from './../../models/companyModel';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class CompanyService {

  private baseUrl = "http://localhost:8089/project2024/api/v1/company";

  constructor(private http:HttpClient) { }


  addCompany(data: Company): Observable<Company> {
 
    return this.http.post<Company>(`${this.baseUrl}`, data);

  }
  getAllCompany(): Observable<Company[]> { // Correction : Ajout du type de retour Observable<Course[]>
    return this.http.get<Company[]>(`${this.baseUrl}`); // Correction : Préciser le type de retour
  }
  getCompanyById(companyId: any): Observable<Company> {
    return this. http.get<Company>(`${this.baseUrl}/${companyId}`);
  }
  updateCompany(companyId: any, data: Company): Observable<Company> {
    return this. http.put<Company>(`${this.baseUrl}/${companyId}`, data);

  }
  public deleteCompany(companyId: any): Observable<void> {
    return this.http.delete<void>(`${this.baseUrl}/${companyId}`);
  }


}
