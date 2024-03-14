import { TestService } from './../../../services/testService/test.service';
import { Component, OnInit } from '@angular/core';
import { Post } from 'src/app/models/postModel';
import { PostService } from 'src/app/services/postService/post.service';

@Component({
  selector: 'app-select',
  templateUrl: './select.component.html',
  styleUrls: ['./select.component.scss']
})
export class SelectComponent implements  OnInit{

  posts: Post[];
  selectedPostId: any;
  newPost: any = {};
  editingPost: any = null;
  newTest: any = {};

  constructor(private postService: PostService, private testService: TestService) { }

  ngOnInit(): void {
    this.getPostsList();
  }

  getPostsList() {
    this.postService.getAllPost().subscribe(
      data => {
        this.posts = data;
      },
      error => {
        console.error("Error fetching posts:", error);
      }
    );
  }

  openEditPostDialog(postId: number): void {
    this.editingPost = this.posts.find(post => post.id === postId);
    this.newPost = { ...this.editingPost }; // Create a copy for editing
    this.openPostDialog();
  }

  closePostDialog(): void {
    const postDialog = document.getElementById('postDialog');
    if (postDialog) {
      postDialog.style.display = 'none';
    }
  }

  openPostDialog(): void {
    const postDialog = document.getElementById('postDialog');
    if (postDialog) {
      postDialog.style.display = 'block';
    }
  }

  editPost(): void {
    this.postService.updatePost(this.editingPost.id, this.newPost).subscribe(
      updatedPost => {
        console.log('Post updated successfully:', updatedPost);
        this.getPostsList();
        this.closePostDialog();
      },
      error => {
        console.error('Error updating post:', error);
      }
    );
  }

  deletePost(postId: number): void {
    if (confirm('Are you sure you want to delete this post?')) {
      this.postService.deletePost(postId).subscribe(
        () => {
          console.log('Post deleted successfully.');
          this.getPostsList();
        },
        error => {
          console.error('Error deleting post:', error);
        }
      );
    }
  }

  saveTest(): void {
    this.testService.addTestToPost(this.newTest, this.selectedPostId).subscribe(
      savedTest => {
        console.log('Test saved successfully:', savedTest);
        this.closeTestDialog();
      },
      error => {
        console.error('Error saving test:', error);
      }
    );
  }

  openAddTestDialog(postId: any): void {
    this.selectedPostId = postId;
    this.newTest = {};
    this.openTestDialog();
  }

  closeTestDialog(): void {
    const testDialog = document.getElementById('testDialog');
    if (testDialog) {
      testDialog.style.display = 'none';
    }
  }

  openTestDialog(): void {
    const testDialog = document.getElementById('testDialog');
    if (testDialog) {
      testDialog.style.display = 'block';
    }
  }

}
