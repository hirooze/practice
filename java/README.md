# practice (Java + C)

This repository contains simple Java examples and a minimal setup to also build and run a sample C program in CI.

Java:
- A `pom.xml` is provided that sets Java 21 as the release version. Build locally with:

```pwsh
mvn -DskipTests package
```

- C:
- Sample C source: `../c/hello.c` (moved to repository `c/` directory)
- Build locally with `make` (requires `gcc` and `make`):

```pwsh
# from this directory (practice/java)
make -C ../c
../c/build/bin/hello
```

CI:
- GitHub Actions workflow (`.github/workflows/ci.yml`) builds Java (Maven) and then compiles/runs the C sample on `ubuntu-latest` using `gcc`.
