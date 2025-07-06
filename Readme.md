# Infrastructure As a Coode


## Setup

1. Create a S3 bucket to store statefile in the remote storage. 

    Run 'create_s3_bucket.sh' file after set +x permission.

    ```
        create_s3_bucket.sh <bucket-name> <region-name>
        // For example: create_s3_bucket.sh devopslearningcircle-terraform-statefile us-east-1

    ```

    The code line will help to create a S3 bucket in the region that you specified as the command line argument. The bucket can be user to store the statefile in the remote location to ensure a batter colloboration.
    
2. Lets generate a backend.tf file in all test modules under modulesTest folder, This require since we are using a S3 bucket to store the state file. All test modules will share the same S3 bucket.

    Run "generate_backend.sh" file after set +x permission.

    ```
        generate_backend.sh <bucket-name> <region-name>
        // Example: generate_backend.sh devopslearningcircle-terraform-statefile us-east-1
        
    ```


## How To Do

Fillter AWS Image
1. 


aws ec2 describe-images --region us-east-1 --owners 099720109477 --filters "Name=name,Values=ubuntu-noble-*" --query "Images[*].[ImageId,Name]" --output table