// company-details.component.ts

import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { switchMap } from 'rxjs/operators';
import { Company } from 'src/app/models/companyModel';
import { CompanyService } from 'src/app/services/companyService/company.service';

@Component({
  selector: 'app-company-details',
  templateUrl: './company-details.component.html',
  styleUrls: ['./company-details.component.scss']
})
export class CompanyDetailsComponent implements OnInit {

  company: Company | null = null;

  constructor(
    private route: ActivatedRoute,
    private companyService: CompanyService
  ) { }

  ngOnInit(): void {
    this.route.paramMap.pipe(
      switchMap(params => {
        const companyId = params.get('id');
        if (companyId) {
          return this.companyService.getCompanyById(+companyId);
        } else {
          throw new Error('Company ID not provided');
        }
      })
    ).subscribe(
      company => {
        this.company = company;
      },
      error => {
        console.error('Error fetching company details:', error);
      }
    );
  }

}
