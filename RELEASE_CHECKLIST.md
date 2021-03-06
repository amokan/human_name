# Release checklist

In order to release a new version to Hex.pm we first need to:

1. Write the changes in the `CHANGELOG.md` file
2. Update the `README.md`, `CHANGELOG.md`, `Cargo.toml`, and `mix.exs` with the new version
3. Commit and create a tag for that version, while remembering to use a `v` prefix
4. Push the changes to the repository with: `git push origin main --tags`
5. Wait for the CI to build all release files
6. Run `mix rustler_precompiled.download HumanName.Native --all --print`
7. Run `mix hex.publish` and **make sure the checksum file is present**
in the list of files to be published.

It's important to ensure that we publish the checksum file with the
package because otherwise the users won't be able to use the lib
with precompiled files. They will need to always enforce compilation.
