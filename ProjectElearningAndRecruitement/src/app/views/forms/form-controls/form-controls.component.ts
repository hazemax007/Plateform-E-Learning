import { PostService } from './../../../services/postService/post.service';
import { Company } from 'src/app/models/companyModel';
import { CompanyService } from './../../../services/companyService/company.service';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-form-controls',
  templateUrl: './form-controls.component.html',
  styleUrls: ['./form-controls.component.scss']
})
export class FormControlsComponent implements  OnInit {

  public favoriteColor = '#26ab3c';

  companies:Company[]

  newCompany: any = {}; 

  editingCompany: any = null;

  newPost: any = {}

  postCompany: any = null

  constructor(private companyService:CompanyService, private postService:PostService) { }

  ngOnInit(): void {
    this.getCompaniesList()
  }

  getCompaniesList(){
    this.companyService.getAllCompany().subscribe(
      data => {
        this.companies = data
        console.log(this.companies)
      }, error => {
        alert("Error")
      }
    )
  }

  

  openAddCompanyDialog(): void {
    this.newCompany = {};
    this.editingCompany = null;
    this.openDialogCompany();
  }

  openEditCompanyDialog(companyId: number): void {
    // Retrieve the product to edit based on the product ID
    this.editingCompany = this.companies.find(company => company.id === companyId);
    this.newCompany = { ...this.editingCompany }; // Create a copy for editing
    this.openDialogCompany();
    console.log(companyId)
  }

  closeCompanyDialog(): void {
    this.closeDialogCompany();
  }

  private openDialogCompany(): void {
    const productDialog = document.getElementById('productDialog') || document.getElementById('postDialog');
    if (productDialog) {
      productDialog!.style.display = 'block';
    }
  }

  private closeDialogCompany(): void {
    const productDialog = document.getElementById('productDialog');
    const postDialog = document.getElementById('postDialog');
    if (productDialog || postDialog) {
      productDialog!.style.display = 'none';
      postDialog!.style.display = 'none'
    }
  }
  saveCompany(): void {
    if (this.editingCompany) {
      // Update existing product
      this.companyService.updateCompany(this.editingCompany.companyID, this.newCompany).subscribe(
        updatedCompany => {
          // Handle success (e.g., update the local product list)
          console.log('Company updated successfully:', updatedCompany);
          this.updateLocalCompanyList(updatedCompany);
          this.getCompaniesList()
        },
        error => {
          // Handle error
          console.error('Error updating product:', error);
        }
      );
    } else {
      // Add new product
      this.companyService.addCompany(this.newCompany).subscribe(
        savedCompany => {
          // Handle success (e.g., update the local product list)
          console.log('Company saved successfully:', savedCompany);
          this.updateLocalCompanyList(savedCompany);
          this.getCompaniesList()
        },
        error => {
          // Handle error
          console.error('Error saving product:', error);
        }
      );
    }

    // Close the dialog after saving or updating
    this.closeDialogCompany();
  }

  deleteCompany(companyId: number): void {
    if (confirm('Are you sure you want to delete this company?')) {
      this.companyService.deleteCompany(companyId).subscribe(
        () => {
          // Handle success (e.g., update the local company list)
          console.log('Company deleted successfully.');
          this.updateLocalCompanyList(companyId);
          this.getCompaniesList()
        },
        error => {
          // Handle error
          console.error('Error deleting company:', error);
        }
      );
    }
  }
   updateLocalCompanyList(updatedCompany: any): void {
    // Update the local product list based on the API response
    const index = this.companies.findIndex(company => company.id === updatedCompany.id);

    if (index !== -1) {
      // If the product exists, update it
      this.companies[index] = updatedCompany;
    } else {
      // If the product is new, add it to the list
      this.companies.push(updatedCompany);
    }
  }

  openAddPostDialog(id: any): void {
    this.postCompany = id; // Store the company ID to associate the post with
    this.openDialogPost();
  }

  closePostDialog(): void {
    this.closeDialogPost();
  }

  savePost(companyId: any): void {
    this.postService.addPostToCompany(this.newPost, companyId).subscribe(
      savedPost => {
        console.log('Post saved successfully:', savedPost);
        // Refresh company list or perform other actions if needed
      },
      error => {
        console.error('Error saving post:', error);
      }
    );
    this.closePostDialog();
  }

  private openDialogPost(): void {
    const postDialog = document.getElementById('postDialog');
    if (postDialog) {
      postDialog.style.display = 'block';
    }
  }

  private closeDialogPost(): void {
    const postDialog = document.getElementById('postDialog');
    if (postDialog) {
      postDialog.style.display = 'none';
    }
  }

}
