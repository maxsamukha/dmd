/*
TEST_OUTPUT:
---
fail_compilation/test12558.d(17): Error: `catch` statement without an exception specification is deprecated
fail_compilation/test12558.d(17):        use `catch(Throwable)` for old behavior
fail_compilation/test12558.d(22): Error: `catch` statement without an exception specification is deprecated
fail_compilation/test12558.d(22):        use `catch(Throwable)` for old behavior
---
*/

void main()
{
    auto handler = () { };

    try {
        assert(0);
    } catch
        handler();

    try {
        assert(0);
    } catch {
        handler();
    }

    // ensure diagnostics are not emitted for verioned-out blocks
    version (none)
    {
        try {
            assert(0);
        } catch  // should not emit diagnostics
            handler();

        try {
            assert(0);
        } catch {  // ditto
            handler();
        }
    }
}
