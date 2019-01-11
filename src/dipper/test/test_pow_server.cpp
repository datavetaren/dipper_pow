#include <assert.h>
#include <iostream>
#include <boost/filesystem.hpp>

#ifdef _WIN32
#ifndef _WIN32_WINNT
#define _WIN32_WINNT 0x0501
#endif
#endif

#include "../pow_server.hpp"
#include "../observatory.hpp"
#include "../pow_verifier.hpp"

using namespace prologcoin::pow;

static void header( const std::string &str )
{
    std::cout << "\n";
    std::cout << "--- [" + str + "] " + std::string(60 - str.length(), '-') << "\n";
    std::cout << "\n";
}

static void run_server()
{
    std::string pow_dir = "src/dipper/test";

    header("Running server at port 8080");

    pow_server server("localhost", "8080", pow_dir);
    server.run();
}

int main(int argc, char *argv[])
{
    if (argc == 1) {
	std::cout << "Running tests. If you want to run the server interactively, pass --server" << std::endl;
    } else if (argc == 2) {
	if (strcmp(argv[1], "--server") == 0) {
	    run_server();
	}
    }

    return 0;
}
