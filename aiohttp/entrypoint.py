import aiohttp
import asyncio
import glob
from time import time


async def main() -> None:
    start_at: float = time()

    print("Before TCPConnector")

    connector = aiohttp.TCPConnector(limit=16)
    paths = glob.glob("./char-dataset/**/*")
    file_count: int = len(paths)

    async with aiohttp.ClientSession(connector=connector) as session:
        print("ClientSession Init")
        for path in paths:
            path = path[14:]

            response = await session.get(
                f"http://server/{path}"
            )

            content: bytes = await response.read()
            target_encoding: str = response.get_encoding()

            print(f"{path=} | {target_encoding=}")

    print(f"Delay {round(time() - start_at, 4)}s ({file_count} file(s))")

if __name__ == "__main__":
    asyncio.run(
        main()
    )
