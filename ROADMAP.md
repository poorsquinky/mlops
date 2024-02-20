
## the basic path

- [X] make a jupyterlab docker container!
    - [ ] volume mount for notebooks
    - [ ] volume for training data?

- [ ] get a model working in jupyter notebook
- [ ] make a dockerfile to set up the base image
- [ ] script to train and validate the model, packaging up the trained model alongside a report of its accuracy etc.
    - [ ] include the package requirements in the artifact

- [ ] taking that trained model and putting it in a flask or fastAPI container

- [ ] how about using my laptop-docker-compose pytest script thing? that's pretty great for what i need

## next steps

- [ ] get the data into redis for training -- or another data store?
- [ ] how about a clean path from jupyter to docker?
- [ ] CI/CD: get it working with git and webhooks
- [ ] git workflow with webhooks
    - [ ] what is a good project model?  here's a guess:
        - base dockerfiles for conda and build scripts (?)
        - model definition
        - dataset definitions
        - rest API
        - test container
- [ ] whylogs to track model drift?

## questions


- [ ] how do we get from jupyter to docker?  what's a clean path?
- [ ] what's a good practice for making training data available?  Just have a redis container?

- [ ] does it make sense to have each component be a separate CI/CD managed project?
    - data ingest (for each dataset?)
    - feature extraction
    - labeling
    - jupyter notebook for experimentation
    - converter for jupyter-> app model  (or do we just rely on people copypasting)
    - model trainer (+verification?)
    - [ ] maybe we just define a production application and worry about the rest later?
        - model + API (or messaging system)
        - 

- [ ] what's a good way to get project dependencies into a jupyter container?

- [ ] does a setup like above help with parameter optimization?
    - [ ] should an optimizer be its own containerized service?

- [ ] how can we reuse feature extraction for regular model input?
    - [ ] should a feature extractor be a service?


## What needs doing?

- [ ] step one is writing out all these steps!

- [ ] docker image build pipeline:
    - [ ] miniconda image
    - [ ] how do we pull in the requirements for a particular model?
        - honestly just ship a Dockerfile alongside the model
            - but it needs to pull from a manifest that an individual developer using something like jupyter would use
            - [ ] verify this part of the pipeline according to the training materials

- [ ] feature extraction

- [ ] training phase
    

- [ ] packaging up a pre-trained model artifact

- [ ] CI/CD
    [ ] webhook plugin for gitea?  https://github.com/adnanh/webhook


- [ ] missing from the course????
    - [ ] training data store!
    - [ ] labeling phase (is that the right term?) -- unattended?
    - [ ] feature extraction phase

## refer:

- https://github.com/docker-science/cookiecutter-docker-science?tab=readme-ov-file
- https://docker-science.github.io/


