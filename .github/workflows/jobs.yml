jobs:
  example-job:
    name: example
    runs-on: ubuntu-latest
    steps:
    - name: log untrusted output
      run: |

        # disable command workflow processing
        echo "::stop-commands::`echo -n ${{ github.token }} | sha256sum | head -c 64`"

        # log untrusted output
        echo "untrusted output"

        # enable workflow command processing
        echo "::`echo -n ${{ github.token }} | sha256sum | head -c 64`::"
