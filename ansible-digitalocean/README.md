# Ansible Digital Ocean

This is ansible playbook to provisioning droplet in Digital Ocean using API Token, included to create droplet or destroy droplet.

# Preview
- https://www.youtube.com/watch?v=v6A8LrQ6pgM


# How To

1. Clone this repo.

    ```
    git clone https://github.com/jerukitumanis/ansible-digitalocean.git
    ```

2. Execute __controller.sh__

    ```
    chmod +x controller.sh && ./controller.sh
    ```

3. Choose your options to create included: size, image and region. And finish you can access  your droplet using spesified ip message after provisioning.

# Note

Don't forget to change variable in *vars/main.yml*.
