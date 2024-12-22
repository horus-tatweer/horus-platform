FROM fellah/gitbook:latest

WORKDIR /docs

# Copy all documentation content
COPY . .

# Install GitBook plugins
RUN gitbook install

# Build the documentation
RUN gitbook build

# Expose ports for GitBook server
EXPOSE 4000 35729

# Command to serve GitBook
CMD ["gitbook", "serve"]
