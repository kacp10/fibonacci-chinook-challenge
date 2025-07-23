from python.fib import fib_list

def test_fib_list_basic():
    assert fib_list([0,1,2,3,10,30]) == [0,1,1,2,55,832040]
