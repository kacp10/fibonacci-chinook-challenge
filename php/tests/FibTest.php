<?php
declare(strict_types=1);

require __DIR__ . '/../../vendor/autoload.php';
require __DIR__ . '/../fib.php';

use PHPUnit\Framework\TestCase;

final class FibTest extends TestCase {
    public function testFibList(): void {
        $this->assertSame(
            [0,1,1,2,55,832040],
            fibList([0,1,2,3,10,30])
        );
    }
}
