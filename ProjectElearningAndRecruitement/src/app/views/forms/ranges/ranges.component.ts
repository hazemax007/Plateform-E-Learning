// ranges.component.ts

import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Company } from 'src/app/models/companyModel';
import { CompanyService } from 'src/app/services/companyService/company.service';

@Component({
  selector: 'app-ranges',
  templateUrl: './ranges.component.html',
  styleUrls: ['./ranges.component.scss']
})
export class RangesComponent implements OnInit {

  companies: Company[];
  filteredCompanies: Company[] = [];
  searchQuery: string = '';

  constructor(private companyService: CompanyService, private router: Router) { }

  ngOnInit(): void {
    this.getCompaniesList();
  }

  getCompaniesList() {
    this.companyService.getAllCompany().subscribe(
      data => {
        this.companies = data;
        this.filteredCompanies = [...this.companies]; // Initialize filteredCompanies with all companies
      },
      error => {
        alert("Error fetching companies");
      }
    )
  }

  filterCompanies() {
    if (!this.searchQuery.trim()) {
      this.filteredCompanies = [...this.companies]; // Reset filter and show all companies
    } else {
      this.filteredCompanies = this.companies.filter(company =>
        company.name.toLowerCase().includes(this.searchQuery.toLowerCase())
      );
    }
  }

  navigateToCompanyDetails(companyId: number) {
    this.router.navigate(['/company-details', companyId]);
  }

}


